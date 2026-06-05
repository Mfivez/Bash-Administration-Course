# Correction module 2

```bash
ls -la ~/novacorp > ~/novacorp/logs/stdout.log
ls /dossier_inexistant 2> ~/novacorp/logs/stderr.log
ls ~/novacorp /dossier_inexistant &> ~/novacorp/logs/complete.log

cat > ~/novacorp/scripts/check_server.sh <<'EOF'
#!/usr/bin/env bash
echo "Machine : $(hostname)"
echo "Date    : $(date)"
echo "User    : $(whoami)"
EOF

chmod +x ~/novacorp/scripts/check_server.sh
~/novacorp/scripts/check_server.sh > ~/novacorp/reports/check_server.txt
```

Points de correction : différencier sortie normale et erreur, vérifier le droit `x`.
