# Module 7 — Automatisation, sauvegarde, supervision et sécurité

## Objectifs

Vous automatisez des tâches récurrentes, créez des sauvegardes, vérifiez l'espace disque et appliquez des règles de sécurité de base dans les scripts Bash.

## 1. Planifier avec cron

Cron lance des commandes selon une planification définie par cinq champs.

Format :

```text
* * * * * commande
1 2 3 4 5
```

Lecture des champs :

| Champ | Rôle |
|---:|---|
| 1 | minute |
| 2 | heure |
| 3 | position dans le mois |
| 4 | mois |
| 5 | champ calendrier complémentaire |

Exemples :

```bash
0 2 * * * /home/admin/novacorp/scripts/backup_novacorp.sh
*/5 * * * * /home/admin/novacorp/scripts/check_disk.sh
```

Commandes :

```bash
crontab -l
crontab -e
```

### Exercice intégré 1

Écrire une ligne cron qui exécute un script selon une planification fixe.

Exemple de réponse :

```text
30 23 * * * /chemin/vers/script.sh
```

## 2. Sauvegarder avec `tar`

```bash
tar -czf archive.tar.gz dossier/
```

Options :

| Option | Sens |
|---|---|
| `-c` | créer une archive |
| `-z` | compresser gzip |
| `-f` | nom du fichier archive |
| `-x` | extraire |
| `-t` | lister |

### Exercice intégré 2

```bash
tar -czf ~/novacorp/backup/data-test.tar.gz -C ~/novacorp data
tar -tzf ~/novacorp/backup/data-test.tar.gz | head
```

## 3. Horodatage

```bash
date +"%Y-%m-%d_%H-%M-%S"
```

Exemple :

```bash
archive="backup_$(date +"%Y-%m-%d_%H-%M-%S").tar.gz"
```

## 4. Journaliser un script

```bash
echo "$(date '+%F %T') [INFO] Sauvegarde OK" >> ~/novacorp/logs/backup.log
```

Fonction utile :

```bash
log() {
    local level="$1"
    local message="$2"
    echo "$(date '+%F %T') [$level] $message" >> "$LOG_FILE"
}
```

## 5. Rotation simple

Supprimer les archives anciennes selon un seuil de conservation :

```bash
find ~/novacorp/backup -name "*.tar.gz" -type f -mtime +30 -delete
```

Prudence : tester sans `-delete` d'abord.

```bash
find ~/novacorp/backup -name "*.tar.gz" -type f -mtime +30 -print
```

## 6. Vérification disque

```bash
df -P
```

Extraire le pourcentage :

```bash
df -P | awk 'NR>1 {gsub("%", "", $5); print $6, $5}'
```

### Exercice intégré 3

Afficher une alerte si une partition dépasse 80 % :

```bash
df -P | awk 'NR>1 {gsub("%", "", $5); if ($5 >= 80) print "ALERTE", $6, $5"%"}'
```

## 7. Sécurité dans les scripts

Mauvais :

```bash
rm -rf $dossier
```

Meilleur :

```bash
rm -rf -- "$dossier"
```

Encore mieux : vérifier avant action.

```bash
if [ -z "$dossier" ] || [ "$dossier" = "/" ]; then
    echo "Chemin dangereux" >&2
    exit 2
fi
```

## 8. Mini-projets

### `backup_novacorp.sh`

Fonctions attendues :

- source configurable ;
- destination configurable ;
- archive `.tar.gz` horodatée ;
- log d'exécution ;
- vérification du code retour ;
- rotation optionnelle.

### `check_disk.sh`

Fonctions attendues :

- seuil configurable ;
- analyse de `df -P` ;
- log des alertes ;
- code retour `0` si OK, `2` si alerte.

## Livrables

```text
~/novacorp/scripts/backup_novacorp.sh
~/novacorp/scripts/check_disk.sh
~/novacorp/logs/backup.log
~/novacorp/logs/disk.log
```
