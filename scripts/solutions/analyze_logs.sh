#!/usr/bin/env bash
set -uo pipefail

usage() {
    cat <<'EOF'
Usage: analyze_logs.sh <fichier_log> [rapport]

Analyse un fichier de log texte et génère un rapport : niveaux,
erreurs récentes et IP les plus fréquentes.
EOF
}

if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
    usage
    exit 0
fi

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    usage >&2
    exit 2
fi

log_file="$1"
report_file="${2:-$HOME/novacorp/reports/log_report.txt}"

if [ ! -f "$log_file" ]; then
    echo "Erreur : fichier de log introuvable : $log_file" >&2
    exit 3
fi

if [ ! -r "$log_file" ]; then
    echo "Erreur : fichier de log non lisible : $log_file" >&2
    exit 4
fi

mkdir -p "$(dirname "$report_file")"

total_lines=$(wc -l < "$log_file")
info_count=$(grep -c "INFO" "$log_file" || true)
warning_count=$(grep -Ec "WARNING|WARN" "$log_file" || true)
error_count=$(grep -c "ERROR" "$log_file" || true)
debug_count=$(grep -c "DEBUG" "$log_file" || true)

{
    echo "Rapport d'analyse de logs NovaCorp"
    echo "Généré le : $(date '+%F %T')"
    echo "Fichier   : $log_file"
    echo
    echo "Résumé"
    echo "------"
    echo "Total lignes : $total_lines"
    echo "INFO         : $info_count"
    echo "WARNING/WARN : $warning_count"
    echo "ERROR        : $error_count"
    echo "DEBUG        : $debug_count"
    echo
    echo "Niveaux détectés"
    echo "----------------"
    awk '{for (i=1; i<=NF; i++) if ($i ~ /^(INFO|WARNING|WARN|ERROR|DEBUG)$/) print $i}' "$log_file" | sort | uniq -c | sort -nr || true
    echo
    echo "10 dernières erreurs"
    echo "--------------------"
    grep "ERROR" "$log_file" | tail -n 10 || echo "Aucune erreur trouvée"
    echo
    echo "IP les plus fréquentes"
    echo "----------------------"
    grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$log_file" | sort | uniq -c | sort -nr | head -n 10 || true
} > "$report_file"

echo "Rapport généré : $report_file"
