# Cours Bash & Administration Linux

Dépôt pédagogique prêt à publier sur GitHub pour apprendre Bash depuis zéro et progresser vers l'administration Linux. Le parcours suit un fil rouge professionnel : construire une boîte à outils Bash pour l'entreprise fictive **NovaCorp**.

## Objectif général

À la fin du parcours, l'apprenant sait utiliser un terminal Linux, écrire des scripts Bash structurés, analyser des logs, gérer des fichiers et permissions, surveiller l'état d'un serveur, automatiser des sauvegardes et assembler une boîte à outils d'administration.

## Public cible

- Débutants complets en Linux.
- Techniciens support ou exploitation.
- Futurs administrateurs Linux.
- Profils DevOps juniors souhaitant consolider les bases Bash.

## Prérequis

Aucun prérequis Linux n'est obligatoire. Il est recommandé de savoir utiliser un ordinateur, copier/coller du texte et organiser des fichiers.

## Environnement recommandé

- Une VM Ubuntu Server LTS, Debian ou équivalent.
- Un utilisateur standard avec accès `sudo`.
- Ressources suffisantes pour une VM de lab Linux.
- Éditeur texte : `nano` au début, puis `vim` ou `code` selon le niveau.

Voir : [`docs/00-environnement-lab.md`](docs/00-environnement-lab.md).

## Démarrage rapide apprenant

```bash
git clone <URL_DU_DEPOT>
cd formation-bash-linux-admin
./scripts/setup_lab.sh
cd ~/novacorp
```

Le script crée un environnement de travail local :

```text
~/novacorp/
├── backup/
├── data/
├── logs/
├── reports/
├── scripts/
└── tmp/
```

## Structure du dépôt

```text
formation-bash-linux-admin/
├── cours/                  # Cours complets organisés par modules
├── ateliers/               # Travaux pratiques guidés
├── corrections/            # Corrigés formateur et auto-correction
├── docs/                   # Guides, fil rouge, glossaire, cheatsheets
├── projet-final/           # Cahier des charges du projet final
├── ressources/             # Données de lab, logs, modèles
├── scripts/                # Scripts de setup, starters et solutions
├── suivi/                  # Fiches de suivi apprenant et formateur
├── tests/                  # Vérifications automatiques simples
├── .github/workflows/      # CI GitHub Actions basique
├── mkdocs.yml              # Navigation optionnelle pour publication web
└── README.md
```

## Progression du parcours

| Module | Thème | Livrable principal |
|---:|---|---|
| 1 | Linux, terminal, arborescence | Arborescence NovaCorp créée |
| 2 | Fichiers, flux, pipes, permissions | Premiers logs et script exécutable |
| 3 | Premiers scripts Bash | `check_file.sh` |
| 4 | Boucles, fonctions, menus | `user_report.sh` |
| 5 | Traitement texte et logs | `analyze_logs.sh` |
| 6 | Administration système | `server_health.sh` |
| 7 | Automatisation, sauvegarde, supervision | `backup_novacorp.sh` et `check_disk.sh` |
| 8 | Projet final | `admin_toolkit.sh` |

## Fil rouge pédagogique

Le fil rouge suit l'entreprise fictive **NovaCorp**. Les participants construisent progressivement une boîte à outils Bash pour administrer une petite infrastructure Linux : vérifier l'état du serveur, analyser des logs, gérer des utilisateurs, sauvegarder des données et générer des rapports.

Voir : [`docs/00-fil-rouge-novacorp.md`](docs/00-fil-rouge-novacorp.md).

## Comment utiliser ce support

L'ordre conseillé est :

1. Lire le module correspondant dans `cours/`.
2. Faire les mini-exercices intégrés dans la théorie.
3. Réaliser l'atelier associé dans `ateliers/`.
4. Utiliser les corrections uniquement après une tentative réelle.
5. Compléter la fiche de suivi dans `suivi/suivi-apprenant.md`.

Pour piloter le parcours, commencer par :

- [`docs/00-guide-formateur.md`](docs/00-guide-formateur.md)
- [`suivi/suivi-formateur.csv`](suivi/suivi-formateur.csv)
- [`docs/evaluation.md`](docs/evaluation.md)

## Validation automatique simple

```bash
bash tests/test_scripts.sh
```

Cette commande vérifie au minimum la syntaxe Bash des scripts fournis et exécute quelques tests non destructifs.

## Convention pédagogique

Chaque notion suit le rythme :

```text
Comprendre → Voir un exemple → Modifier → Réutiliser dans le fil rouge → Valider
```
