#!/usr/bin/env bash
set -uo pipefail

service=""
output="$HOME/novacorp/reports/server_health.txt"

usage() {
    cat <<'EOF'
Usage: server_health.sh [--service NOM] [--output FICHIER]

Génère un rapport court sur l'état du serveur.
EOF
}

while [ "$#" -gt 0 ]; do
    case "$1" in
        --service)
            service="${2:-}"
            shift 2
            ;;
        --output)
            output="${2:-}"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Erreur : option inconnue : $1" >&2
            usage >&2
            exit 2
            ;;
    esac
done

if [ -z "$output" ]; then
    echo "Erreur : fichier de sortie vide" >&2
    exit 2
fi

mkdir -p "$(dirname "$output")"

section() {
    echo
    echo "## $1"
}

{
    echo "Rapport santé serveur NovaCorp"
    echo "Généré le : $(date '+%F %T')"

    section "Identité"
    echo "Hostname : $(hostname)"
    echo "User     : $(whoami)"
    echo "Kernel   : $(uname -r)"
    echo "Uptime   : $(uptime -p 2>/dev/null || uptime)"

    section "Mémoire"
    if command -v free >/dev/null 2>&1; then
        free -h
    else
        echo "Commande free indisponible"
    fi

    section "Disque"
    df -h

    section "Utilisateurs connectés"
    who || true

    section "Top processus mémoire"
    ps aux --sort=-%mem 2>/dev/null | head -n 6 || ps aux | head -n 6

    section "Ports en écoute"
    if command -v ss >/dev/null 2>&1; then
        ss -tuln 2>/dev/null || echo "Impossible de lire les ports en écoute dans cet environnement"
    else
        echo "Commande ss indisponible"
    fi

    if [ -n "$service" ]; then
        section "Service $service"
        if command -v systemctl >/dev/null 2>&1; then
            if systemctl is-active --quiet "$service" 2>/dev/null; then
                echo "Service actif : $service"
            else
                echo "Service inactif ou indisponible : $service"
                systemctl status "$service" --no-pager 2>/dev/null | head -n 12 || true
            fi
        else
            echo "systemctl indisponible dans cet environnement"
        fi
    fi
} > "$output"

echo "Rapport généré : $output"
