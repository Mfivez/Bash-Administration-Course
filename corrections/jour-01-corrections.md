# Correction Jour 1

```bash
mkdir -p ~/novacorp/{scripts,logs,backup,data,reports,tmp}
touch ~/novacorp/data/users.txt
touch ~/novacorp/logs/application.log
printf "alice\nbob\n" > ~/novacorp/data/users.txt

{
  echo "Utilisateur : $(whoami)"
  echo "Machine     : $(hostname)"
  echo "Date        : $(date)"
  echo "Arborescence :"
  find ~/novacorp -maxdepth 2 -type d | sort
} > ~/novacorp/reports/jour-01.txt

cat ~/novacorp/reports/jour-01.txt
```

Points de correction : vérifier les chemins, l'existence des dossiers, et l'absence de travail dans `/` ou `/etc`.
