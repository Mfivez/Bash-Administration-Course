# Correction module 5

Une version complète est disponible dans `scripts/solutions/analyze_logs.sh`.

Commandes de base :

```bash
log=~/novacorp/logs/application.log
wc -l < "$log"
grep -c "ERROR" "$log"
grep -E "ERROR|WARNING" "$log"
awk '{print $3}' "$log" | sort | uniq -c
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$log" | sort | uniq -c | sort -nr | head
```
