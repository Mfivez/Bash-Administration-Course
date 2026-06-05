#!/usr/bin/env bash
set -uo pipefail

usage() {
    cat <<'EOF'
Usage: check_file.sh <fichier>

Vérifie qu'un chemin correspond à un fichier lisible, puis affiche
quelques informations utiles.
EOF
}

if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
    usage
    exit 0
fi

if [ "$#" -ne 1 ]; then
    usage >&2
    exit 2
fi

file="$1"

if [ ! -e "$file" ]; then
    echo "Erreur : fichier introuvable : $file" >&2
    exit 3
fi

if [ ! -f "$file" ]; then
    echo "Erreur : ce chemin n'est pas un fichier normal : $file" >&2
    exit 3
fi

if [ ! -r "$file" ]; then
    echo "Erreur : fichier non lisible : $file" >&2
    exit 4
fi

line_count=$(wc -l < "$file")
size_bytes=$(stat -c%s "$file" 2>/dev/null || wc -c < "$file")

echo "Fichier        : $file"
echo "Taille octets  : $size_bytes"
echo "Nombre lignes  : $line_count"
echo "Aperçu :"
head -n 5 "$file"
