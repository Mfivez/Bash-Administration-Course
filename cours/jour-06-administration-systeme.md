# Jour 6 — Bash pour l'administration système Linux

## Objectifs

Vous utilisez Bash pour diagnostiquer un serveur : système, mémoire, disque, utilisateurs, processus, services et réseau.

## 1. Identifier la machine

```bash
hostname
uname -a
uptime
whoami
who
w
```

### Exercice intégré 1

Créer une commande qui affiche : machine, noyau, uptime.

```bash
{
  hostname
  uname -r
  uptime
}
```

## 2. CPU et mémoire

```bash
lscpu
free -h
cat /proc/meminfo | head
```

Pour un rapport court :

```bash
free -h | awk 'NR==2 {print "Mémoire utilisée : "$3" / "$2}'
```

## 3. Disques

```bash
df -h
du -sh ~/novacorp
lsblk
```

### Exercice intégré 2

Afficher les systèmes de fichiers à plus de 80 % :

```bash
df -P | awk 'NR>1 {gsub("%", "", $5); if ($5 >= 80) print $0}'
```

## 4. Utilisateurs et groupes

Fichiers importants :

```bash
/etc/passwd
/etc/group
```

Commandes utiles :

```bash
id
getent passwd
getent group
cut -d":" -f1 /etc/passwd
```

Création d'utilisateur, en VM uniquement :

```bash
sudo useradd -m utilisateur
sudo passwd utilisateur
sudo userdel -r utilisateur
```

### Exercice intégré 3

Lister les 10 premiers utilisateurs locaux :

```bash
cut -d":" -f1 /etc/passwd | head
```

## 5. Processus

```bash
ps aux
top
pgrep ssh
kill PID
pkill nom_processus
```

Signaux courants :

| Signal | Usage |
|---|---|
| SIGTERM | demander l'arrêt propre |
| SIGKILL | forcer l'arrêt |
| SIGHUP | recharger certains services |

### Exercice intégré 4

```bash
ps aux | grep bash
pgrep -a bash
```

## 6. Services avec systemd

```bash
systemctl status ssh
systemctl is-active ssh
systemctl start ssh
systemctl stop ssh
systemctl restart ssh
systemctl enable ssh
```

Toutes les machines de lab n'ont pas les mêmes services. Adaptez avec `cron`, `ssh`, `nginx` ou un service disponible.

Logs systemd :

```bash
journalctl -u ssh
journalctl -xe
journalctl --since "1 hour ago"
```

## 7. Réseau de base

```bash
ip a
ip route
hostname -I
ping -c 3 8.8.8.8
curl -I https://example.org
ss -tuln
```

### Exercice intégré 5

Afficher les ports en écoute :

```bash
ss -tuln
```

## 8. Mini-projet du jour : `server_health.sh`

Le script doit générer un rapport avec :

- date ;
- hostname ;
- noyau ;
- uptime ;
- mémoire ;
- disque ;
- utilisateurs connectés ;
- ports en écoute ;
- statut d'un service si demandé.

Exemple d'appel :

```bash
./server_health.sh --service ssh --output ~/novacorp/reports/server_health.txt
```

## Points de vigilance

- Toutes les commandes système ne sont pas disponibles partout.
- `systemctl` peut ne pas fonctionner dans certains conteneurs.
- Les commandes avec `sudo` doivent être réservées à la VM de formation.
- Un diagnostic doit être lisible, pas seulement complet.

## Livrable

```text
~/novacorp/scripts/server_health.sh
~/novacorp/reports/server_health.txt
```
