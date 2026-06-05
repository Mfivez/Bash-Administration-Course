# Correction Jour 3

Une version complète est disponible dans `scripts/solutions/check_file.sh`.

Version courte :

```bash
#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <fichier>" >&2
    exit 2
fi

fichier="$1"

[ -e "$fichier" ] || { echo "Absent: $fichier" >&2; exit 3; }
[ -f "$fichier" ] || { echo "Pas un fichier: $fichier" >&2; exit 3; }
[ -r "$fichier" ] || { echo "Non lisible: $fichier" >&2; exit 4; }

echo "Fichier : $fichier"
echo "Lignes  : $(wc -l < "$fichier")"
head -n 5 "$fichier"
```
