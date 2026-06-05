# Atelier module 2 — Redirections, pipes et permissions

## Objectif

Comprendre les sorties standard, les erreurs et rendre un script exécutable.

## Étape 1 — Capturer stdout

```bash
ls -la ~/novacorp > ~/novacorp/logs/stdout.log
```

## Étape 2 — Capturer stderr

```bash
ls /dossier_inexistant 2> ~/novacorp/logs/stderr.log
```

## Étape 3 — Tout capturer

```bash
ls ~/novacorp /dossier_inexistant &> ~/novacorp/logs/complete.log
```

## Étape 4 — Utiliser un pipe

Comptez le nombre d'éléments dans `/etc` :

```bash
ls /etc | wc -l
```

## Étape 5 — Créer un script

Créer `~/novacorp/scripts/check_server.sh` :

```bash
#!/usr/bin/env bash
echo "Machine : $(hostname)"
echo "Date    : $(date)"
echo "User    : $(whoami)"
```

Tester avant et après `chmod +x`.

## Validation

```bash
ls -l ~/novacorp/scripts/check_server.sh
~/novacorp/scripts/check_server.sh
```

## Bonus

Redirigez la sortie du script vers `reports/check_server.txt`.
