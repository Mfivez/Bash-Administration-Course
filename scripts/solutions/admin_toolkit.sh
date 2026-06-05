#!/usr/bin/env bash
set -uo pipefail

NOVACORP_HOME="${NOVACORP_HOME:-$HOME/novacorp}"
SCRIPT_DIR="$NOVACORP_HOME/scripts"
DATA_DIR="$NOVACORP_HOME/data"
LOG_DIR="$NOVACORP_HOME/logs"
REPORT_DIR="$NOVACORP_HOME/reports"
BACKUP_DIR="$NOVACORP_HOME/backup"

usage() {
    cat <<'EOF'
Usage: admin_toolkit.sh [commande]

Sans commande, lance le menu interactif.
Commandes non interactives :
  health   Générer un diagnostic serveur
  disk     Vérifier le disque
  users    Générer le rapport utilisateurs
  logs     Analyser les logs
  backup   Lancer une sauvegarde
  report   Générer un rapport complet
EOF
}

ensure_dirs() {
    mkdir -p "$SCRIPT_DIR" "$DATA_DIR" "$LOG_DIR" "$REPORT_DIR" "$BACKUP_DIR"
}

run_script() {
    local script="$1"
    shift
    if [ ! -x "$SCRIPT_DIR/$script" ]; then
        echo "Erreur : script absent ou non exécutable : $SCRIPT_DIR/$script" >&2
        return 1
    fi
    "$SCRIPT_DIR/$script" "$@"
}

show_system_info() {
    run_script "server_health.sh" --service ssh --output "$REPORT_DIR/server_health.txt"
    cat "$REPORT_DIR/server_health.txt"
}

check_disk() {
    run_script "check_disk.sh" --threshold 80 --log "$LOG_DIR/disk.log" || true
}

list_users() {
    echo "Utilisateurs locaux :"
    cut -d":" -f1 /etc/passwd | sort | head -n 50
}

prepare_users() {
    run_script "user_report.sh" "$DATA_DIR/users-simple.txt" "$REPORT_DIR/user_report.txt"
    cat "$REPORT_DIR/user_report.txt"
}

analyze_logs() {
    run_script "analyze_logs.sh" "$LOG_DIR/application.log" "$REPORT_DIR/log_report.txt"
    cat "$REPORT_DIR/log_report.txt"
}

backup_data() {
    run_script "backup_novacorp.sh" --source "$DATA_DIR" --destination "$BACKUP_DIR" --retention 7 --log "$LOG_DIR/backup.log"
}

generate_full_report() {
    local report="$REPORT_DIR/admin_report_$(date '+%Y-%m-%d_%H-%M-%S').txt"
    {
        echo "Rapport complet NovaCorp"
        echo "Généré le : $(date '+%F %T')"
        echo
        echo "# Système"
        hostname
        uname -r
        uptime
        echo
        echo "# Mémoire"
        free -h || true
        echo
        echo "# Disque"
        df -h
        echo
        echo "# Utilisateurs locaux"
        cut -d":" -f1 /etc/passwd | head -n 30
        echo
        echo "# Logs applicatifs - résumé"
        if [ -f "$REPORT_DIR/log_report.txt" ]; then
            sed -n '1,40p' "$REPORT_DIR/log_report.txt"
        else
            echo "Aucun rapport de logs existant. Lancez l'option 5."
        fi
        echo
        echo "# Sauvegardes"
        ls -lh "$BACKUP_DIR" 2>/dev/null || true
    } > "$report"
    echo "Rapport complet généré : $report"
}

menu() {
    while true; do
        cat <<EOF

=== NovaCorp Admin Toolkit ===
1. Afficher les informations système
2. Vérifier l'espace disque
3. Lister les utilisateurs
4. Préparer la création d'utilisateurs depuis un fichier
5. Analyser les logs
6. Sauvegarder les données
7. Générer un rapport complet
8. Quitter
EOF
        read -r -p "Votre choix : " choice
        case "$choice" in
            1) show_system_info ;;
            2) check_disk ;;
            3) list_users ;;
            4) prepare_users ;;
            5) analyze_logs ;;
            6) backup_data ;;
            7) generate_full_report ;;
            8|q|Q) echo "Au revoir"; break ;;
            *) echo "Choix invalide" ;;
        esac
    done
}

main() {
    ensure_dirs
    case "${1:-}" in
        "") menu ;;
        -h|--help) usage ;;
        health) show_system_info ;;
        disk) check_disk ;;
        users) prepare_users ;;
        logs) analyze_logs ;;
        backup) backup_data ;;
        report) generate_full_report ;;
        *) echo "Commande inconnue : $1" >&2; usage >&2; exit 2 ;;
    esac
}

main "$@"
