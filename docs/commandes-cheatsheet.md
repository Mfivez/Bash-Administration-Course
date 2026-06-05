# Cheatsheet commandes Linux/Bash

## Navigation

```bash
pwd
ls
ls -la
cd /chemin
cd ~
cd ..
```

## Fichiers et dossiers

```bash
touch fichier.txt
mkdir dossier
mkdir -p a/b/c
cp source destination
mv ancien nouveau
rm fichier
rm -r dossier
```

## Lecture de fichiers

```bash
cat fichier
less fichier
head fichier
tail fichier
tail -f fichier
wc -l fichier
```

## Recherche

```bash
find . -name "*.log"
grep "ERROR" fichier.log
grep -R "mot" dossier/
```

## Redirections et pipes

```bash
commande > sortie.txt
commande >> sortie.txt
commande 2> erreurs.log
commande &> tout.log
commande1 | commande2
```

## Permissions

```bash
ls -l
chmod +x script.sh
chmod 755 script.sh
chmod 644 fichier.txt
chown user:group fichier
```

## Scripts

```bash
bash script.sh
chmod +x script.sh
./script.sh
bash -x script.sh
```

## Système

```bash
hostname
uname -a
uptime
free -h
df -h
du -sh dossier
ps aux
systemctl status service
journalctl -u service
ip a
ss -tuln
```
