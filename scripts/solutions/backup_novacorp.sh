#!/usr/bin/env bash
set -uo pipefail

source_dir="$HOME/novacorp/data"
destination_dir="$HOME/novacorp/backup"
retention_days=7
log_file="$HOME/novacorp/logs/backup.log"

usage() {
    cat <<'EOF'
Usage: backup_novacorp.sh [--source DOSSIER] [--destination DOSSIER] [--retention JOURS]

Crée une archive tar.gz horodatée du dossier source et écrit un log.
EOF
}

log() {
    local level="$1"
    local message="$2"
    mkdir -p "$(dirname "$log_file")"
    echo "$(date '+%F %T') [$level] $message" >> "$log_file"
}

while [ "$#" -gt 0 ]; do
    case "$1" in
        --source|-s)
            source_dir="${2:-}"
            shift 2
            ;;
        --destination|-d)
            destination_dir="${2:-}"
            shift 2
            ;;
        --retention|-r)
            retention_days="${2:-}"
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

if [ ! -d "$source_dir" ]; then
    echo "Erreur : dossier source introuvable : $source_dir" >&2
    log "ERROR" "Source introuvable : $source_dir"
    exit 3
fi

if ! [[ "$retention_days" =~ ^[0-9]+$ ]]; then
    echo "Erreur : rétention invalide : $retention_days" >&2
    exit 2
fi

mkdir -p "$destination_dir"
mkdir -p "$(dirname "$log_file")"

timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
base_name=$(basename "$source_dir")
archive="$destination_dir/${base_name}_${timestamp}.tar.gz"

log "INFO" "Début sauvegarde source=$source_dir archive=$archive"

if tar -czf "$archive" -C "$(dirname "$source_dir")" "$base_name"; then
    size=$(du -h "$archive" | awk '{print $1}')
    log "INFO" "Sauvegarde OK archive=$archive taille=$size"
    echo "Sauvegarde créée : $archive ($size)"
else
    log "ERROR" "Échec sauvegarde archive=$archive"
    echo "Erreur : échec de la sauvegarde" >&2
    exit 1
fi

# Rotation prudente : uniquement dans le dossier destination et uniquement les archives .tar.gz
find "$destination_dir" -maxdepth 1 -type f -name "*.tar.gz" -mtime +"$retention_days" -print -delete >> "$log_file" 2>&1 || true
