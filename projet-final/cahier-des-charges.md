# Cahier des charges — Projet final NovaCorp

## Mission

Créer une boîte à outils Bash permettant d'exécuter les tâches courantes d'administration Linux pour NovaCorp.

## Script principal

```text
admin_toolkit.sh
```

## Emplacement attendu

```text
~/novacorp/scripts/admin_toolkit.sh
```

## Menu attendu

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

## Contraintes

- Le script doit être exécutable.
- Le script doit utiliser des fonctions.
- Les chemins doivent être configurables ou faciles à modifier.
- Les rapports doivent être écrits dans `~/novacorp/reports`.
- Les logs de scripts doivent être écrits dans `~/novacorp/logs`.
- Les erreurs doivent être compréhensibles.
- Les variables doivent être protégées par des guillemets.

## Rapport complet

Le rapport complet doit contenir :

- date ;
- hostname ;
- noyau ;
- uptime ;
- mémoire ;
- disque ;
- utilisateurs locaux ;
- statut d'au moins un service ;
- résumé des logs ;
- état des sauvegardes.

## Démonstration attendue

Durée : 5 à 10 minutes.

L'apprenant doit montrer :

1. l'arborescence ;
2. le lancement du menu ;
3. une option de diagnostic ;
4. une option de logs ;
5. une sauvegarde ;
6. un rapport généré ;
7. une erreur gérée proprement.
