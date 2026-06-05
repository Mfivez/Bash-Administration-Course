# Atelier module 4 — Script `user_report.sh`

## Objectif

Lire un fichier d'utilisateurs et produire un rapport.

## Fichier d'entrée

Utilisez :

```text
~/novacorp/data/users-simple.txt
```

Chaque ligne contient un login. Les lignes vides et les lignes commençant par `#` doivent être ignorées.

## Fonctionnalités attendues

- vérifier le fichier d'entrée ;
- créer le dossier de rapport si nécessaire ;
- lire ligne par ligne ;
- vérifier si le compte existe avec `getent passwd` ;
- compter les comptes présents et absents ;
- écrire un rapport horodaté.

## Exemple d'appel

```bash
~/novacorp/scripts/user_report.sh ~/novacorp/data/users-simple.txt ~/novacorp/reports/user_report.txt
```

## Bonus

Ajouter une validation du nom de login avec une expression régulière simple.
