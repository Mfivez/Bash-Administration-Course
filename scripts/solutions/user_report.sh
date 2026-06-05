#!/usr/bin/env bash
set -uo pipefail

usage() {
    cat <<'EOF'
Usage: user_report.sh <fichier_utilisateurs> [rapport]

Lit un fichier contenant un login par ligne, ignore les lignes vides
et commentaires, puis indique si chaque utilisateur existe localement.
EOF
}

log_error() {
    echo "Erreur : $1" >&2
}

if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
    usage
    exit 0
fi

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    usage >&2
    exit 2
fi

input_file="$1"
output_file="${2:-$HOME/novacorp/reports/user_report.txt}"

if [ ! -f "$input_file" ]; then
    log_error "fichier d'entrée introuvable : $input_file"
    exit 3
fi

mkdir -p "$(dirname "$output_file")"

present=0
absent=0
invalid=0
processed=0

{
    echo "Rapport utilisateurs NovaCorp"
    echo "Généré le : $(date '+%F %T')"
    echo "Source    : $input_file"
    echo
    printf '%-25s %-12s\n' "LOGIN" "STATUT"
    printf '%-25s %-12s\n' "-----" "------"

    while IFS= read -r user || [ -n "$user" ]; do
        # Supprimer espaces de début/fin simples
        user="${user#${user%%[![:space:]]*}}"
        user="${user%${user##*[![:space:]]}}"

        [ -z "$user" ] && continue
        [[ "$user" =~ ^# ]] && continue

        processed=$((processed + 1))

        if [[ ! "$user" =~ ^[a-z_][a-z0-9_-]*[$]?$ ]]; then
            printf '%-25s %-12s\n' "$user" "INVALIDE"
            invalid=$((invalid + 1))
            continue
        fi

        if getent passwd "$user" > /dev/null; then
            printf '%-25s %-12s\n' "$user" "EXISTE"
            present=$((present + 1))
        else
            printf '%-25s %-12s\n' "$user" "ABSENT"
            absent=$((absent + 1))
        fi
    done < "$input_file"

    echo
    echo "Total traités : $processed"
    echo "Existants     : $present"
    echo "Absents       : $absent"
    echo "Invalides     : $invalid"
} > "$output_file"

echo "Rapport généré : $output_file"
