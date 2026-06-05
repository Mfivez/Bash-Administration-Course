# Conventions Bash du cours

## En-tête conseillé

```bash
#!/usr/bin/env bash
set -uo pipefail
```

`set -e` est présenté progressivement. Il peut être utile mais demande de comprendre ses effets.

## Variables

Toujours protéger les variables :

```bash
echo "$nom"
cp -- "$source" "$destination"
```

Éviter :

```bash
cp $source $destination
```

## Fonctions

```bash
log_info() {
    local message="$1"
    echo "[INFO] $message"
}
```

## Codes de sortie

| Code | Signification conseillée |
|---:|---|
| 0 | Succès |
| 1 | Erreur générale |
| 2 | Mauvais usage ou argument invalide |
| 3 | Fichier ou ressource absent |
| 4 | Permission insuffisante |

## Messages

Un bon message indique :

- ce qui a été tenté ;
- ce qui a échoué ;
- comment corriger.

Exemple :

```bash
echo "Erreur : fichier introuvable : $fichier" >&2
```

## Usage standard

```bash
usage() {
    cat <<'EOF'
Usage: script.sh <argument>

Description courte.
EOF
}
```
