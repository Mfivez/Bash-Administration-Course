# Atelier Jour 3 — Script `check_file.sh`

## Objectif

Écrire un script qui vérifie un fichier passé en argument.

## Fonctionnalités attendues

Le script doit :

- afficher un usage si aucun argument n'est fourni ;
- vérifier que le chemin existe ;
- vérifier que c'est un fichier ;
- vérifier qu'il est lisible ;
- afficher le nombre de lignes ;
- afficher les cinq premières lignes ;
- retourner un code d'erreur clair.

## Tests à réaliser

```bash
~/novacorp/scripts/check_file.sh ~/novacorp/data/users.txt
~/novacorp/scripts/check_file.sh ~/novacorp/logs/application.log
~/novacorp/scripts/check_file.sh /dossier/inexistant
~/novacorp/scripts/check_file.sh
```

## Validation

Le script doit réussir sur un fichier existant et échouer proprement sur un fichier absent.

## Bonus

Ajouter une option `--help`.
