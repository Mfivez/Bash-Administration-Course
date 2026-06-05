#!/usr/bin/env bash
set -Eeuo pipefail

COURSE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NOVACORP_HOME="${NOVACORP_HOME:-$HOME/novacorp}"

mkdir -p "$NOVACORP_HOME"/{scripts,logs,backup,data,reports,tmp}

cp "$COURSE_ROOT"/ressources/data/* "$NOVACORP_HOME/data/"
cp "$COURSE_ROOT"/ressources/logs/* "$NOVACORP_HOME/logs/"
cp "$COURSE_ROOT"/scripts/solutions/*.sh "$NOVACORP_HOME/scripts/"
chmod +x "$NOVACORP_HOME/scripts/"*.sh

cat > "$NOVACORP_HOME/README-LAB.txt" <<EOF
Lab NovaCorp initialisé.

Dossier : $NOVACORP_HOME

Sous-dossiers :
- scripts : scripts Bash
- data    : fichiers d'entrée
- logs    : logs applicatifs et logs de scripts
- reports : rapports générés
- backup  : archives de sauvegarde
- tmp     : tests temporaires

Commencer par :
cd "$NOVACORP_HOME"
EOF

echo "Lab NovaCorp prêt : $NOVACORP_HOME"
echo "Scripts copiés dans : $NOVACORP_HOME/scripts"
