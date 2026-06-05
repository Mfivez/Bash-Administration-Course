#!/usr/bin/env bash
set -uo pipefail

threshold=80
log_file="$HOME/novacorp/logs/disk.log"

usage() {
    cat <<'EOF'
Usage: check_disk.sh [--threshold POURCENT] [--log FICHIER]

Vérifie l'occupation disque avec df -P.
Retourne 0 si tout est OK, 2 si au moins une partition dépasse le seuil.
EOF
}

while [ "$#" -gt 0 ]; do
    case "$1" in
        --threshold|-t)
            threshold="${2:-}"
            shift 2
            ;;
        --log)
            log_file="${2:-}"
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

if ! [[ "$threshold" =~ ^[0-9]+$ ]] || [ "$threshold" -lt 1 ] || [ "$threshold" -gt 100 ]; then
    echo "Erreur : seuil invalide : $threshold" >&2
    exit 2
fi

mkdir -p "$(dirname "$log_file")"
alert=0

echo "$(date '+%F %T') [INFO] Vérification disque seuil=${threshold}%" >> "$log_file"

while IFS= read -r line; do
    filesystem=$(echo "$line" | awk '{print $1}')
    used_percent=$(echo "$line" | awk '{print $5}' | tr -d '%')
    mountpoint=$(echo "$line" | awk '{print $6}')

    if [ "$used_percent" -ge "$threshold" ]; then
        alert=1
        message="ALERTE disque : $mountpoint à ${used_percent}% ($filesystem)"
        echo "$message"
        echo "$(date '+%F %T') [WARNING] $message" >> "$log_file"
    fi
done < <(df -P -x tmpfs -x devtmpfs | awk 'NR>1')

if [ "$alert" -eq 0 ]; then
    echo "OK : aucune partition au-dessus de ${threshold}%"
    echo "$(date '+%F %T') [INFO] Disque OK" >> "$log_file"
    exit 0
fi

exit 2
