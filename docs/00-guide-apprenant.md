# Guide apprenant

## Comment travailler avec ce cours

L'objectif n'est pas de tout mémoriser. L'objectif est de comprendre comment chercher, tester et assembler des commandes pour résoudre un problème d'administration Linux.

## Méthode conseillée

Pour chaque commande :

1. lire la commande ;
2. deviner ce qu'elle va faire ;
3. l'exécuter ;
4. observer le résultat ;
5. expliquer le résultat avec ses mots ;
6. noter une variante utile.

## Règles de sécurité

- Ne lancez jamais une commande que vous ne comprenez pas.
- Soyez prudent avec `rm`, `mv`, `chmod`, `chown`, `userdel`, `kill`.
- Travaillez dans `~/novacorp`, pas dans des dossiers système.
- Faites des sauvegardes avant modification.
- Lisez les erreurs : elles donnent souvent la solution.

## Commandes de secours

```bash
pwd                 # Où suis-je ?
ls -la              # Que contient le dossier ?
cd ~                # Retour au dossier personnel
history             # Historique des commandes
clear               # Nettoyer l'écran
man commande        # Lire la documentation
commande --help     # Aide rapide
```

## Carnet personnel

Pour chaque module, notez :

- trois commandes apprises ;
- une erreur rencontrée ;
- une chose à revoir ;
- une chose réutilisable au travail.

Utilisez [`suivi/suivi-apprenant.md`](../suivi/suivi-apprenant.md).
