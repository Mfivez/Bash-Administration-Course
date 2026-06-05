# Atelier module 6 — Script `server_health.sh`

## Objectif

Créer un rapport de diagnostic serveur.

## Fonctionnalités attendues

Le rapport doit contenir :

- date ;
- hostname ;
- noyau ;
- uptime ;
- mémoire ;
- disque ;
- utilisateurs connectés ;
- ports en écoute ;
- statut d'un service si l'option est fournie.

## Exemple d'appel

```bash
~/novacorp/scripts/server_health.sh --service ssh --output ~/novacorp/reports/server_health.txt
```

## Cas particulier

Si `systemctl` ne fonctionne pas dans votre environnement, le script doit afficher un message clair au lieu de planter.

## Bonus

Ajouter une section processus qui affiche les 5 processus consommant le plus de mémoire.
