# Correction Jour 6

Une version complète est disponible dans `scripts/solutions/server_health.sh`.

Commandes attendues dans le rapport :

```bash
hostname
uname -r
uptime
free -h
df -h
who
ss -tuln
systemctl is-active ssh
```

Point important : `systemctl` doit être testé, car il peut être indisponible dans un conteneur.
