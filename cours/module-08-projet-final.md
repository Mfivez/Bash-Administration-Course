# Module 8 — Projet final et industrialisation

## Objectifs

Vous assemblez les scripts du parcours dans une boîte à outils d'administration Bash cohérente, testable et présentable.

## 1. Architecture professionnelle minimale

```text
admin-toolkit/
├── scripts/
├── data/
├── logs/
├── reports/
├── backup/
└── README.md
```

Dans un projet Bash, séparez :

- les scripts ;
- les fichiers d'entrée ;
- les logs ;
- les rapports ;
- les sauvegardes ;
- la documentation.

## 2. Rappels qualité

Un script professionnel doit être :

- compréhensible ;
- reproductible ;
- prudent ;
- testable ;
- documenté ;
- explicite en cas d'erreur.

## 3. Option `--help`

Chaque script principal devrait expliquer son usage.

```bash
usage() {
    cat <<'EOF'
Usage: admin_toolkit.sh

Menu interactif d'administration NovaCorp.
EOF
}
```

## 4. Débogage

Lancer un script en mode trace :

```bash
bash -x script.sh
```

Ajouter temporairement :

```bash
set -x
```

## 5. Introduction à Git

Commandes utiles :

```bash
git init
git status
git add .
git commit -m "Ajout toolkit NovaCorp"
git log --oneline
```

Bonnes pratiques de commit :

- un commit par changement logique ;
- message court et clair ;
- pas de secrets dans le dépôt ;
- pas de sauvegardes volumineuses générées.

## 6. Cahier des charges du projet final

Créer `admin_toolkit.sh` avec menu :

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

## 7. Exigences techniques

Le script doit :

- utiliser des fonctions ;
- gérer les choix invalides ;
- vérifier les fichiers avant lecture ;
- écrire les rapports dans `reports/` ;
- réutiliser les scripts créés dans le parcours si possible ;
- produire un rapport complet horodaté ;
- fonctionner depuis `~/novacorp/scripts`.

## 8. Démonstration finale

Chaque apprenant ou groupe présente :

1. l'arborescence ;
2. le menu ;
3. une analyse de logs ;
4. une vérification disque ;
5. une sauvegarde ;
6. le rapport complet ;
7. une erreur gérée proprement.

## 9. Améliorations possibles

- options non interactives ;
- configuration dans un fichier `.conf` ;
- logs JSON ;
- tests automatisés ;
- intégration avec GitHub Actions ;
- utilisation de `shellcheck` ;
- packaging `.deb` interne.

## Livrable final

```text
~/novacorp/scripts/admin_toolkit.sh
~/novacorp/reports/admin_report_YYYY-MM-DD_HH-MM-SS.txt
```

Le projet est évalué avec la grille dans [`../projet-final/grille-recette.md`](../projet-final/grille-recette.md).
