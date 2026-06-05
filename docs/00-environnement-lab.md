# Environnement de lab

## Option recommandée : VM Linux

Utiliser une VM dédiée est le meilleur choix pour apprendre l'administration Linux sans risque.

Configuration minimale :

```text
OS       : Debian, Ubuntu Server ou équivalent
CPU      : 2 vCPU
RAM      : 2 à 4 Go
Disque   : 20 Go
Compte   : utilisateur standard avec sudo
Réseau   : accès internet si installation de paquets nécessaire
```

## Paquets utiles

Sur Debian/Ubuntu :

```bash
sudo apt update
sudo apt install -y bash coreutils findutils grep sed gawk tar gzip curl iproute2 procps cron git tree
```

`tree`, `gawk` et `git` sont utiles mais pas indispensables pour comprendre Bash.

## Initialiser le fil rouge

Depuis la racine du dépôt :

```bash
./scripts/setup_lab.sh
```

Par défaut, le lab est créé dans :

```text
~/novacorp
```

Pour choisir un autre emplacement :

```bash
NOVACORP_HOME=/tmp/novacorp ./scripts/setup_lab.sh
```

## Précaution importante

Les scripts fournis sont conçus pour un environnement pédagogique. Les scripts qui touchent aux utilisateurs, services ou permissions doivent être testés dans une VM avant toute adaptation professionnelle.

## Distribution non Debian

Les commandes Bash générales restent identiques. Les commandes de paquets changent :

| Famille | Gestionnaire courant |
|---|---|
| Debian/Ubuntu | `apt` |
| Red Hat/Rocky/Alma | `dnf` ou `yum` |
| SUSE | `zypper` |

Les services systemd utilisent généralement `systemctl` sur les distributions modernes.
