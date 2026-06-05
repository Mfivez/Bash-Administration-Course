# Correction module 7

Versions complètes :

- `scripts/solutions/backup_novacorp.sh`
- `scripts/solutions/check_disk.sh`

Test sauvegarde :

```bash
~/novacorp/scripts/backup_novacorp.sh --source ~/novacorp/data --destination ~/novacorp/backup
ls -lh ~/novacorp/backup
```

Test disque :

```bash
~/novacorp/scripts/check_disk.sh --threshold 80
```

Ligne cron exemple :

```text
0 2 * * * /home/admin/novacorp/scripts/backup_novacorp.sh
*/15 * * * * /home/admin/novacorp/scripts/check_disk.sh --threshold 80
```
