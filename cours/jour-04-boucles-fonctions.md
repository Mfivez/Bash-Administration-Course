# Jour 4 — Boucles, fonctions et scripts structurés

## Objectifs

Vous apprenez à répéter des traitements, lire un fichier ligne par ligne, organiser un script en fonctions et créer un menu simple.

## 1. Boucle `for`

```bash
for nom in alice bob charlie; do
    echo "Utilisateur : $nom"
done
```

Sur des fichiers :

```bash
for fichier in ~/novacorp/logs/*.log; do
    echo "$fichier"
done
```

### Exercice intégré 1

Affichez la taille de chaque fichier `.log` :

```bash
for fichier in ~/novacorp/logs/*.log; do
    du -h "$fichier"
done
```

## 2. Boucle `while read`

Pour lire un fichier ligne par ligne :

```bash
while IFS= read -r ligne; do
    echo "Ligne : $ligne"
done < fichier.txt
```

`IFS=` et `-r` évitent des surprises avec les espaces et antislashs.

### Exercice intégré 2

```bash
while IFS= read -r user; do
    echo "Compte à vérifier : $user"
done < ~/novacorp/data/users-simple.txt
```

## 3. Ignorer les lignes vides et commentaires

```bash
[ -z "$ligne" ] && continue
[[ "$ligne" =~ ^# ]] && continue
```

### Exercice intégré 3

Ajoutez une ligne vide et une ligne `# test` dans `users-simple.txt`, puis modifiez la boucle pour les ignorer.

## 4. Fonctions

Une fonction évite de répéter du code.

```bash
log_info() {
    local message="$1"
    echo "[INFO] $message"
}

log_info "Démarrage du script"
```

### Exercice intégré 4

Créer une fonction `ligne_separation` qui affiche 40 tirets.

## 5. Fonctions avec retour

Une fonction peut retourner un code :

```bash
verifier_fichier() {
    local fichier="$1"
    [ -f "$fichier" ]
}

if verifier_fichier "$HOME/novacorp/data/users-simple.txt"; then
    echo "OK"
else
    echo "Absent"
fi
```

## 6. `case` et menu simple

```bash
read -r -p "Votre choix : " choix
case "$choix" in
    1) echo "Info système" ;;
    2) echo "Utilisateurs" ;;
    q|Q) echo "Quitter" ;;
    *) echo "Choix invalide" ;;
esac
```

### Exercice intégré 5

Créer un menu avec trois choix : afficher la date, afficher la machine, quitter.

## 7. Mini-projet du jour : `user_report.sh`

Objectif : lire `users-simple.txt` et produire un rapport.

Fonctions attendues :

- vérifier que le fichier existe ;
- ignorer lignes vides et commentaires ;
- compter les utilisateurs ;
- vérifier si l'utilisateur existe localement avec `getent passwd` ;
- écrire le rapport dans `reports/user_report.txt`.

Extrait utile :

```bash
if getent passwd "$user" > /dev/null; then
    statut="existe"
else
    statut="absent"
fi
```

## Points de vigilance

- Ne pas utiliser `for user in $(cat fichier)` pour lire un fichier d'utilisateurs.
- Protéger les variables.
- Utiliser `local` dans les fonctions.
- Séparer affichage, validation et traitement.

## Atelier fil rouge du jour

Écrire `~/novacorp/scripts/user_report.sh`, puis tester :

```bash
~/novacorp/scripts/user_report.sh ~/novacorp/data/users-simple.txt ~/novacorp/reports/user_report.txt
cat ~/novacorp/reports/user_report.txt
```

## Livrable

```text
~/novacorp/scripts/user_report.sh
~/novacorp/reports/user_report.txt
```
