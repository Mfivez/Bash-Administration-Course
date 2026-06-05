# Correction module 8

Une version complète est disponible dans `scripts/solutions/admin_toolkit.sh`.

Les points essentiels à vérifier :

- menu lisible ;
- fonctions séparées ;
- appels aux scripts existants ;
- rapports dans `~/novacorp/reports` ;
- gestion des erreurs ;
- option quitter fonctionnelle.

Test minimal :

```bash
bash -n ~/novacorp/scripts/admin_toolkit.sh
~/novacorp/scripts/admin_toolkit.sh --help
```
