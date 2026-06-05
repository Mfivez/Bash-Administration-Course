# Module 5 — Traitement texte, grep, sed, awk et logs

## Objectifs

Vous apprenez à extraire des informations de fichiers texte et à produire un résumé exploitable d'un fichier de log.

## 1. Rechercher avec `grep`

```bash
grep "ERROR" application.log
```

Options utiles :

| Option | Sens |
|---|---|
| `-i` | ignorer la casse |
| `-n` | afficher les numéros de ligne |
| `-c` | compter les lignes correspondantes |
| `-v` | inverser la recherche |
| `-E` | expressions régulières étendues |

### Exercice intégré 1

```bash
grep "ERROR" ~/novacorp/logs/application.log
grep -c "ERROR" ~/novacorp/logs/application.log
grep -n "WARNING" ~/novacorp/logs/application.log
```

## 2. Expressions régulières simples

| Motif | Sens |
|---|---|
| `^ERROR` | ligne commençant par ERROR |
| `ERROR$` | ligne finissant par ERROR |
| `ERROR|WARNING` | ERROR ou WARNING avec `grep -E` |
| `[0-9]+` | une ou plusieurs chiffres avec `grep -E` |

Exemple :

```bash
grep -E "ERROR|WARNING" fichier.log
```

## 3. Trier et compter

```bash
sort fichier.txt
sort fichier.txt | uniq
sort fichier.txt | uniq -c
sort fichier.txt | uniq -c | sort -nr
```

### Exercice intégré 2

Comptez les niveaux de log :

```bash
awk '{print $3}' ~/novacorp/logs/application.log | sort | uniq -c
```

## 4. Extraire des colonnes avec `cut`

```bash
cut -d":" -f1 /etc/passwd
```

`-d` indique le séparateur, `-f` le champ.

### Exercice intégré 3

```bash
cut -d"," -f1 ~/novacorp/data/users.csv | head
```

## 5. Transformer avec `sed`

Remplacement simple :

```bash
sed 's/ancien/nouveau/' fichier.txt
```

Remplacement global :

```bash
sed 's/ancien/nouveau/g' fichier.txt
```

Supprimer des lignes :

```bash
sed '/DEBUG/d' application.log
```

Modification prudente avec sauvegarde :

```bash
sed -i.bak 's/WARNING/WARN/g' fichier.log
```

## 6. Introduction à `awk`

Afficher la première colonne :

```bash
awk '{print $1}' fichier.txt
```

Changer le séparateur :

```bash
awk -F":" '{print $1}' /etc/passwd
```

Filtrer :

```bash
awk '$3 == "ERROR" {print $0}' application.log
```

### Exercice intégré 4

Afficher seulement date, niveau et service du log :

```bash
awk '{print $1, $3, $4}' ~/novacorp/logs/application.log | head
```

## 7. Mini-projet : `analyze_logs.sh`

Le script doit :

- recevoir un fichier de log ;
- vérifier qu'il existe ;
- compter les lignes ;
- compter `ERROR`, `WARNING`, `INFO` ;
- afficher les 10 dernières erreurs ;
- extraire les IP les plus fréquentes si présentes ;
- générer un rapport.

Pipeline utile :

```bash
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' application.log | sort | uniq -c | sort -nr | head
```

## Points de vigilance

- `grep` cherche des lignes.
- `cut` est simple mais limité.
- `sed` transforme des lignes.
- `awk` est très puissant pour les colonnes.
- Toujours tester sur une copie avant modification en place.

## Atelier fil rouge

Créer `~/novacorp/scripts/analyze_logs.sh` et générer :

```text
~/novacorp/reports/log_report.txt
```

## Livrable

```text
~/novacorp/scripts/analyze_logs.sh
~/novacorp/reports/log_report.txt
```
