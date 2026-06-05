# Fil rouge NovaCorp

## Contexte

Vous rejoignez l'équipe IT de **NovaCorp**, une petite entreprise qui exploite plusieurs serveurs Linux. Les tâches sont encore très manuelles. Votre mission consiste à construire une boîte à outils Bash pour fiabiliser les opérations courantes.

## Besoins métier

NovaCorp veut pouvoir :

- vérifier rapidement l'état d'un serveur ;
- consulter les utilisateurs locaux ;
- préparer la création d'utilisateurs depuis un fichier ;
- analyser les logs applicatifs ;
- détecter un disque presque plein ;
- sauvegarder les données importantes ;
- produire un rapport d'administration simple.

## Arborescence de travail

```text
~/novacorp/
├── backup/       # Archives de sauvegarde
├── data/         # Fichiers utilisateurs et données d'entrée
├── logs/         # Logs applicatifs et logs de scripts
├── reports/      # Rapports générés
├── scripts/      # Scripts Bash
└── tmp/          # Tests temporaires
```

## Évolution du fil rouge

| Module | Construction NovaCorp |
|---:|---|
| 1 | Créer l'arborescence et comprendre les chemins |
| 2 | Alimenter les logs, manipuler les droits, rendre un script exécutable |
| 3 | Créer `check_file.sh` pour vérifier un fichier |
| 4 | Créer `user_report.sh` pour traiter une liste d'utilisateurs |
| 5 | Créer `analyze_logs.sh` pour analyser les erreurs applicatives |
| 6 | Créer `server_health.sh` pour diagnostiquer la machine |
| 7 | Créer `backup_novacorp.sh` et `check_disk.sh` |
| 8 | Assembler les fonctions dans `admin_toolkit.sh` |

## Projet final attendu

Un menu interactif :

```text
1. Afficher les informations système
2. Vérifier l'espace disque
3. Lister les utilisateurs
4. Préparer la création d'utilisateurs depuis un fichier
5. Analyser les logs
6. Sauvegarder les données
7. Générer un rapport complet
8. Quitter
```

## Standards professionnels imposés

Chaque script doit :

- commencer par un shebang ;
- avoir une option `--help` si possible ;
- vérifier ses arguments ;
- protéger les variables avec des guillemets ;
- écrire des messages compréhensibles ;
- retourner un code de sortie cohérent ;
- éviter les actions destructrices non confirmées.
