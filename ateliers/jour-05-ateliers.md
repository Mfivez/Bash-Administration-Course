# Atelier Jour 5 — Script `analyze_logs.sh`

## Objectif

Analyser un fichier de log applicatif.

## Fichier d'entrée

```text
~/novacorp/logs/application.log
```

## Fonctionnalités attendues

- total de lignes ;
- nombre de `INFO`, `WARNING`, `ERROR`, `DEBUG` ;
- dix dernières erreurs ;
- IP les plus fréquentes ;
- rapport écrit dans `~/novacorp/reports/log_report.txt`.

## Exemples utiles

```bash
grep -c "ERROR" ~/novacorp/logs/application.log
awk '{print $3}' ~/novacorp/logs/application.log | sort | uniq -c
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' ~/novacorp/logs/application.log | sort | uniq -c | sort -nr
```

## Bonus

Ajouter un argument optionnel pour choisir le niveau à afficher.
