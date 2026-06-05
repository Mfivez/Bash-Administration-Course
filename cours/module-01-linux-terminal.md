# Module 1 — Linux, terminal et arborescence

## Objectifs

À la fin de ce module, vous savez ouvrir un terminal, comprendre le prompt, vous déplacer dans Linux, créer des fichiers et dossiers, lire un fichier et préparer l'arborescence NovaCorp.

## 1. Comprendre Linux simplement

Linux est un système multi-utilisateur. Plusieurs personnes ou services peuvent utiliser la même machine, chacun avec ses droits. En administration, on travaille souvent en ligne de commande parce qu'elle est rapide, scriptable et disponible même sur des serveurs sans interface graphique.

Vocabulaire essentiel :

| Mot | Sens |
|---|---|
| Terminal | Fenêtre dans laquelle on tape les commandes |
| Shell | Programme qui interprète les commandes |
| Bash | Shell utilisé dans cette formation |
| Prompt | Texte affiché avant la commande |
| Root | Super-utilisateur du système |

Exemple de prompt :

```bash
admin@serveur01:~$
```

Lecture : utilisateur `admin`, machine `serveur01`, dossier courant `~`, utilisateur non-root `$`.

### Exercice intégré 1

Tapez :

```bash
whoami
hostname
pwd
date
```

Répondez dans votre suivi : qui êtes-vous, sur quelle machine êtes-vous, et dans quel dossier ?

## 2. L'arborescence Linux

Linux organise tout à partir de `/`, appelé racine.

```text
/
├── home/     # dossiers personnels
├── etc/      # configuration système
├── var/      # logs, fichiers variables
├── tmp/      # fichiers temporaires
├── usr/      # programmes et ressources
└── root/     # dossier personnel du super-utilisateur
```

### Chemin absolu et chemin relatif

Un chemin absolu commence par `/` :

```bash
/etc/passwd
/home/admin/novacorp
```

Un chemin relatif part du dossier courant :

```bash
logs/application.log
../data/users.txt
```

### Exercice intégré 2

```bash
pwd
cd /
pwd
cd ~
pwd
```

Expliquez la différence entre `/` et `~`.

## 3. Commandes de navigation

```bash
pwd         # afficher le dossier courant
ls          # lister simplement
ls -l       # lister avec détails
ls -la      # inclure les fichiers cachés
cd dossier  # changer de dossier
cd ..       # remonter d'un niveau
cd ~        # revenir au dossier personnel
```

### Exercice intégré 3

```bash
cd ~
ls -la
cd /etc
ls | head
cd -
```

`cd -` revient au dossier précédent.

## 4. Créer fichiers et dossiers

```bash
mkdir dossier
touch fichier.txt
mkdir -p parent/enfant/sous-enfant
```

`mkdir -p` crée toute l'arborescence si elle n'existe pas.

### Exemple NovaCorp

```bash
mkdir -p ~/novacorp/{scripts,logs,backup,data,reports,tmp}
touch ~/novacorp/data/users.txt
touch ~/novacorp/logs/application.log
```

### Exercice intégré 4

Créez cette structure, puis vérifiez :

```bash
find ~/novacorp -maxdepth 2 -type d | sort
```

## 5. Copier, déplacer, supprimer

```bash
cp source destination
mv ancien nouveau
rm fichier
rmdir dossier_vide
rm -r dossier
```

Prudence : `rm` supprime réellement. Il n'y a pas toujours de corbeille en terminal.

### Exercice intégré 5

Dans `~/novacorp/tmp` :

```bash
cd ~/novacorp/tmp
touch test.txt
cp test.txt copie.txt
mv copie.txt archive.txt
ls -l
rm archive.txt
```

Ne supprimez pas le dossier `~/novacorp`.

## 6. Lire des fichiers

```bash
cat fichier.txt       # afficher tout
less fichier.txt      # lire page par page
head fichier.txt      # premières lignes
tail fichier.txt      # dernières lignes
wc -l fichier.txt     # compter les lignes
```

### Exercice intégré 6

```bash
echo "alice" >> ~/novacorp/data/users.txt
echo "bob" >> ~/novacorp/data/users.txt
cat ~/novacorp/data/users.txt
wc -l ~/novacorp/data/users.txt
```

## 7. Chercher des fichiers

```bash
find ~/novacorp -name "*.txt"
find ~/novacorp -type d
find ~/novacorp -type f
```

Les jokers sont utiles :

```bash
ls *.txt
ls log*
```

## Atelier fil rouge

Créer proprement l'environnement NovaCorp, puis produire un court fichier `reports/module-01.txt` contenant :

- le nom de l'utilisateur ;
- le nom de la machine ;
- l'arborescence créée ;
- trois commandes apprises.

Commande possible :

```bash
{
  echo "Utilisateur : $(whoami)"
  echo "Machine     : $(hostname)"
  echo "Dossiers NovaCorp :"
  find ~/novacorp -maxdepth 2 -type d | sort
} > ~/novacorp/reports/module-01.txt
```

## Validation

Vous devez pouvoir expliquer :

- ce qu'est le dossier courant ;
- la différence entre chemin absolu et relatif ;
- pourquoi `mkdir -p` est pratique ;
- pourquoi `rm` doit être utilisé avec prudence.

## Livrable

```text
~/novacorp/reports/module-01.txt
```
