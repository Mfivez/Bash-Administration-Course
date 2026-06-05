# Jour 3 — Premiers scripts Bash

## Objectifs

Vous apprenez à écrire un script Bash simple, utiliser des variables, recevoir des arguments, tester des conditions et retourner un code d'erreur.

## 1. Structure minimale

```bash
#!/usr/bin/env bash

echo "Bonjour"
```

La première ligne s'appelle le shebang. Elle indique quel programme doit interpréter le fichier.

### Exécution

```bash
bash script.sh
chmod +x script.sh
./script.sh
```

### Exercice intégré 1

```bash
cat > ~/novacorp/scripts/bonjour.sh <<'EOF'
#!/usr/bin/env bash
echo "Bonjour NovaCorp"
EOF
chmod +x ~/novacorp/scripts/bonjour.sh
~/novacorp/scripts/bonjour.sh
```

## 2. Variables

```bash
nom="Alice"
echo "$nom"
```

Pas d'espace autour du `=`.

Correct :

```bash
serveur="web01"
```

Incorrect :

```bash
serveur = "web01"
```

### Variables système utiles

```bash
echo "$USER"
echo "$HOME"
echo "$PWD"
echo "$SHELL"
echo "$HOSTNAME"
```

### Exercice intégré 2

Créez un script `identity.sh` qui affiche utilisateur, machine et dossier courant.

## 3. Substitution de commande

```bash
maintenant=$(date)
machine=$(hostname)
echo "Rapport généré le $maintenant sur $machine"
```

### Exercice intégré 3

```bash
rapport="~/novacorp/reports/test.txt"
```

Cette ligne ne fonctionne pas comme attendu, car `~` n'est pas développé dans les guillemets. Utilisez plutôt :

```bash
rapport="$HOME/novacorp/reports/test.txt"
```

Testez et expliquez.

## 4. Arguments de script

Dans un script :

| Variable | Sens |
|---|---|
| `$0` | nom du script |
| `$1` | premier argument |
| `$2` | deuxième argument |
| `$#` | nombre d'arguments |
| `$@` | tous les arguments |

Exemple :

```bash
#!/usr/bin/env bash
echo "Script : $0"
echo "Premier argument : $1"
echo "Nombre d'arguments : $#"
```

Lancement :

```bash
./script.sh fichier.txt
```

### Exercice intégré 4

Créer `show_arg.sh` qui affiche le premier argument et refuse l'exécution si aucun argument n'est fourni.

## 5. Conditions

```bash
if [ condition ]; then
    echo "OK"
else
    echo "KO"
fi
```

Tests fichiers :

| Test | Sens |
|---|---|
| `-e` | existe |
| `-f` | fichier normal |
| `-d` | dossier |
| `-r` | lisible |
| `-w` | modifiable |
| `-x` | exécutable |

Exemple :

```bash
fichier="$1"
if [ -f "$fichier" ]; then
    echo "Fichier trouvé"
else
    echo "Fichier absent"
fi
```

## 6. Codes retour

Après une commande :

```bash
echo $?
```

Par convention :

- `0` signifie succès ;
- autre valeur signifie erreur.

Dans un script :

```bash
exit 0
exit 1
```

### Exercice intégré 5

Testez :

```bash
ls /etc
echo $?
ls /dossier_inexistant
echo $?
```

## 7. Mini-projet du jour : `check_file.sh`

Objectif : vérifier un fichier passé en argument.

Version progressive :

```bash
#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <fichier>" >&2
    exit 2
fi

fichier="$1"

if [ ! -e "$fichier" ]; then
    echo "Erreur : fichier introuvable : $fichier" >&2
    exit 3
fi

if [ ! -f "$fichier" ]; then
    echo "Erreur : ce n'est pas un fichier normal : $fichier" >&2
    exit 3
fi

if [ ! -r "$fichier" ]; then
    echo "Erreur : fichier non lisible : $fichier" >&2
    exit 4
fi

echo "Fichier OK : $fichier"
echo "Nombre de lignes : $(wc -l < "$fichier")"
echo "Aperçu :"
head -n 5 "$fichier"
```

## Points de vigilance

- Toujours mettre les variables entre guillemets.
- Toujours vérifier les arguments.
- Écrire les erreurs dans `stderr` avec `>&2`.
- Retourner un code de sortie utile.

## Atelier fil rouge du jour

Créer et tester `~/novacorp/scripts/check_file.sh` sur :

```bash
~/novacorp/data/users.txt
~/novacorp/logs/application.log
/dossier/inexistant
```

## Livrable

```text
~/novacorp/scripts/check_file.sh
```
