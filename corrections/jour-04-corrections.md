# Correction Jour 4

Une version complète est disponible dans `scripts/solutions/user_report.sh`.

Point clé : lire avec `while IFS= read -r`.

```bash
while IFS= read -r user || [ -n "$user" ]; do
    [ -z "$user" ] && continue
    [[ "$user" =~ ^# ]] && continue
    if getent passwd "$user" > /dev/null; then
        echo "$user : existe"
    else
        echo "$user : absent"
    fi
done < "$input"
```
