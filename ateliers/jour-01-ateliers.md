# Atelier Jour 1 — Créer l'espace NovaCorp

## Objectif

Créer l'arborescence de travail et produire un premier rapport.

## Consignes

Travaillez uniquement dans votre dossier personnel.

## Étape 1 — Préparer les dossiers

Créez :

```text
~/novacorp/scripts
~/novacorp/logs
~/novacorp/backup
~/novacorp/data
~/novacorp/reports
~/novacorp/tmp
```

## Étape 2 — Créer les premiers fichiers

Créez :

```text
~/novacorp/data/users.txt
~/novacorp/logs/application.log
```

Ajoutez deux utilisateurs fictifs dans `users.txt`.

## Étape 3 — Explorer

Produisez les commandes qui affichent :

- votre dossier courant ;
- le contenu détaillé de `~/novacorp` ;
- tous les dossiers sous `~/novacorp`.

## Étape 4 — Rapport

Créer `~/novacorp/reports/jour-01.txt` contenant :

- utilisateur courant ;
- hostname ;
- date ;
- arborescence NovaCorp.

## Validation

```bash
cat ~/novacorp/reports/jour-01.txt
find ~/novacorp -maxdepth 2 -type d | sort
```

## Bonus

Installer `tree` si autorisé, puis comparer :

```bash
tree ~/novacorp
```
