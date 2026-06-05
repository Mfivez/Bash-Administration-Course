# Module 2 — Fichiers, flux, pipes et permissions

## Objectifs

Vous apprenez comment Bash exécute les commandes, comment récupérer les sorties, comment chaîner des commandes, et comment comprendre les droits Linux.

## 1. Anatomie d'une commande

```bash
commande option argument
```

Exemples :

```bash
ls -l /etc
head -n 5 fichier.txt
cp source.txt destination.txt
```

Une option modifie le comportement. Un argument indique sur quoi travailler.

### Exercice intégré 1

Pour chaque commande, identifiez commande, option et argument :

```bash
ls -la ~/novacorp
head -n 3 /etc/passwd
wc -l ~/novacorp/data/users.txt
```

## 2. Obtenir de l'aide

```bash
commande --help
man commande
```

Dans `man`, utilisez `/mot` pour chercher, `n` pour suivant, `q` pour quitter.

### Exercice intégré 2

Cherchez à quoi sert l'option `-p` de `mkdir` :

```bash
man mkdir
```

## 3. Les flux standard

Chaque commande peut utiliser trois flux :

| Flux | Numéro | Rôle |
|---|---:|---|
| stdin | 0 | entrée standard |
| stdout | 1 | sortie normale |
| stderr | 2 | sortie d'erreur |

## 4. Redirections

```bash
commande > fichier        # remplace le fichier
commande >> fichier       # ajoute à la fin
commande 2> erreurs.log   # erreurs seulement
commande &> tout.log      # sortie + erreurs
```

### Exemple

```bash
ls /etc > ~/novacorp/logs/liste_etc.log
ls /dossier_inexistant 2> ~/novacorp/logs/erreurs.log
```

### Exercice intégré 3

Créez un fichier contenant la liste détaillée de `~/novacorp` :

```bash
ls -la ~/novacorp > ~/novacorp/reports/liste_novacorp.txt
```

Ajoutez ensuite la date à la fin :

```bash
date >> ~/novacorp/reports/liste_novacorp.txt
```

## 5. Les pipes

Le pipe `|` envoie la sortie d'une commande vers l'entrée d'une autre.

```bash
ls -l /etc | less
cat fichier.txt | wc -l
ps aux | grep ssh
```

On peut souvent éviter `cat` :

```bash
wc -l fichier.txt
```

Mais `cat fichier | commande` reste parfois pédagogique pour comprendre le flux.

### Exercice intégré 4

```bash
ls -la /etc | head
ls -la /etc | wc -l
cat /etc/passwd | cut -d":" -f1 | head
```

## 6. Premiers filtres

```bash
grep "mot" fichier
sort fichier
uniq fichier
wc -l fichier
```

Pour compter les valeurs uniques :

```bash
sort fichier.txt | uniq -c
```

### Exercice intégré 5

```bash
printf "alice\nbob\nalice\n" > ~/novacorp/tmp/noms.txt
sort ~/novacorp/tmp/noms.txt | uniq -c
```

## 7. Permissions Linux

Affichez les droits :

```bash
ls -l fichier
```

Exemple :

```text
-rwxr-xr-- 1 alice support 120 script.sh
```

Lecture simplifiée :

```text
-       type fichier
rwx     droits propriétaire
r-x     droits groupe
r--     droits autres
```

| Lettre | Sens |
|---|---|
| r | lire |
| w | écrire |
| x | exécuter |

## 8. Modifier les permissions

```bash
chmod +x script.sh
chmod 755 script.sh
chmod 644 fichier.txt
```

Repères utiles :

| Mode | Usage courant |
|---:|---|
| 644 | fichier texte lisible, modifiable par propriétaire |
| 755 | script exécutable par tous, modifiable par propriétaire |
| 600 | fichier privé |
| 700 | dossier ou script privé |

### Exercice intégré 6

```bash
echo 'echo "Bonjour NovaCorp"' > ~/novacorp/scripts/hello.sh
ls -l ~/novacorp/scripts/hello.sh
bash ~/novacorp/scripts/hello.sh
chmod +x ~/novacorp/scripts/hello.sh
~/novacorp/scripts/hello.sh
```

Comparez `bash script.sh` et `./script.sh`.

## 9. Propriétaires et groupes

```bash
chown utilisateur fichier
chown utilisateur:groupe fichier
chgrp groupe fichier
```

Ces commandes nécessitent souvent `sudo`. En formation débutant, on les observe avant de les utiliser largement.

## Atelier fil rouge

Créer des sorties de diagnostic :

```bash
ls -la ~/novacorp > ~/novacorp/logs/arborescence.log
ls /etc /dossier_inexistant > ~/novacorp/logs/stdout.log 2> ~/novacorp/logs/stderr.log
```

Créer un script exécutable :

```bash
cat > ~/novacorp/scripts/check_server.sh <<'EOF'
#!/usr/bin/env bash
echo "Machine : $(hostname)"
echo "Date    : $(date)"
echo "User    : $(whoami)"
EOF
chmod +x ~/novacorp/scripts/check_server.sh
~/novacorp/scripts/check_server.sh
```

## Validation

Vous devez pouvoir expliquer :

- la différence entre `>` et `>>` ;
- le rôle de `stderr` ;
- le rôle du pipe ;
- pourquoi un script doit avoir le droit `x` pour être lancé avec `./script.sh`.

## Livrable

```text
~/novacorp/scripts/check_server.sh
~/novacorp/logs/stdout.log
~/novacorp/logs/stderr.log
```
