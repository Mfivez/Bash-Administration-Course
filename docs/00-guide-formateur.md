# Guide formateur

## Intention pédagogique

Cette formation part de zéro, mais elle vise un usage professionnel : automatiser, vérifier, journaliser et documenter. Le formateur doit éviter de transformer la formation en inventaire de commandes. Chaque commande doit répondre à un besoin d'administration.

## Rythme conseillé d'une journée

| Séquence | Durée indicative | Objectif |
|---|---:|---|
| Accueil et rappel | 20 min | Reconnecter avec le fil rouge |
| Démonstration guidée | 60 à 90 min | Introduire les notions du jour |
| Mini-exercices intégrés | 90 min | Faire manipuler immédiatement |
| Atelier fil rouge | 2 h à 3 h | Produire un livrable concret |
| Correction et débrief | 45 min | Corriger les erreurs fréquentes |
| Suivi individuel | 15 min | Compléter la fiche de suivi |

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

Les exercices de création d'utilisateurs et de services doivent être faits dans une VM de formation. Ne pas lancer de scripts d'administration sur une machine de production.

## Évaluation continue

À la fin de chaque journée, vérifier trois points :

1. l'apprenant sait refaire le livrable sans copier-coller aveugle ;
2. l'apprenant comprend les erreurs principales rencontrées ;
3. l'apprenant a complété sa fiche de suivi.

## Remédiation

Pour un groupe très débutant, ralentir sur les jours 1 à 3 et réduire les options avancées de `sed`/`awk` au jour 5. Pour un groupe à l'aise, ajouter des extensions : arguments nommés, logs structurés, tests automatisés, Git, shellcheck.
