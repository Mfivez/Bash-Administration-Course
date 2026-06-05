# Atelier Jour 7 — Sauvegarde et supervision

## Objectif

Créer deux scripts : sauvegarde et vérification disque.

## Script 1 — `backup_novacorp.sh`

Exigences :

- source par défaut : `~/novacorp/data` ;
- destination par défaut : `~/novacorp/backup` ;
- archive horodatée ;
- log dans `~/novacorp/logs/backup.log` ;
- suppression optionnelle des anciennes archives.

Test :

```bash
~/novacorp/scripts/backup_novacorp.sh
ls -lh ~/novacorp/backup
```

## Script 2 — `check_disk.sh`

Exigences :

- seuil par défaut : 80 ;
- option `--threshold` ;
- log dans `~/novacorp/logs/disk.log` ;
- code retour 2 si alerte.

Test :

```bash
~/novacorp/scripts/check_disk.sh --threshold 80
```

## Bonus

Écrire les lignes cron correspondantes dans `reports/cron-proposal.txt`.
