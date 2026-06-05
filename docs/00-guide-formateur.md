# Guide formateur

## Intention pédagogique

Ce cours part de zéro, mais il vise un usage professionnel : automatiser, vérifier, journaliser et documenter. Le formateur doit éviter de transformer le parcours en inventaire de commandes. Chaque commande doit répondre à un besoin d'administration.

## Organisation conseillée d'un module

| Séquence | Objectif |
|---|---|
| Rappel et contexte | Reconnecter la notion avec le fil rouge NovaCorp |
| Démonstration guidée | Montrer la commande ou le concept sur un cas simple |
| Mini-exercices intégrés | Faire manipuler immédiatement |
| Atelier fil rouge | Produire un livrable concret |
| Correction et débrief | Corriger les erreurs fréquentes |
| Suivi individuel | Compléter la fiche de suivi |

## Règles pour débutants

- Toujours faire taper les commandes, même simples.
- Demander aux apprenants d'expliquer le résultat observé.
- Ne pas corriger trop vite : faire lire le message d'erreur.
- Favoriser les commandes non destructives au début.
- Faire verbaliser le lien entre commande et besoin métier.

## Gestion des erreurs fréquentes

| Erreur | Réaction pédagogique |
|---|---|
| Confusion chemin absolu / relatif | Faire dessiner l'arborescence |
| Oubli des guillemets autour des variables | Montrer un nom de fichier avec espace |
| Permission denied | Faire lire `ls -l`, puis expliquer `rwx` |
| Script non exécutable | Comparer `bash script.sh` et `./script.sh` |
| Mauvais fichier modifié | Introduire sauvegarde `.bak` avant modification |

## Utilisation des corrections

Les corrections ne sont pas conçues comme unique solution. Elles montrent une solution propre et progressive. Encouragez les variantes si elles sont lisibles, sûres et explicables.

## Points de vigilance sécurité

Les exercices de création d'utilisateurs et de services doivent être faits dans une VM de lab. Ne pas lancer de scripts d'administration sur une machine de production.

## Évaluation continue

À la fin de chaque module, vérifier trois points :

1. l'apprenant sait refaire le livrable sans copier-coller aveugle ;
2. l'apprenant comprend les erreurs principales rencontrées ;
3. l'apprenant a complété sa fiche de suivi.

## Remédiation

Pour un groupe très débutant, ralentir sur les modules d'introduction et réduire les options avancées de `sed`/`awk`. Pour un groupe à l'aise, ajouter des extensions : arguments nommés, logs structurés, tests automatisés, Git, shellcheck.
