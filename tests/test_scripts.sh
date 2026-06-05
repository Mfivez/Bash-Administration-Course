#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[1/4] Vérification syntaxe Bash"
for script in "$ROOT"/scripts/setup_lab.sh "$ROOT"/scripts/solutions/*.sh "$ROOT"/scripts/starter/*.sh; do
    bash -n "$script"
done

echo "[2/4] Initialisation lab temporaire"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT
NOVACORP_HOME="$TMP_DIR/novacorp" "$ROOT/scripts/setup_lab.sh" >/dev/null

echo "[3/4] Tests fonctionnels non destructifs"
"$TMP_DIR/novacorp/scripts/check_file.sh" "$TMP_DIR/novacorp/data/users-simple.txt" >/dev/null
"$TMP_DIR/novacorp/scripts/user_report.sh" "$TMP_DIR/novacorp/data/users-simple.txt" "$TMP_DIR/novacorp/reports/user_report.txt" >/dev/null
"$TMP_DIR/novacorp/scripts/analyze_logs.sh" "$TMP_DIR/novacorp/logs/application.log" "$TMP_DIR/novacorp/reports/log_report.txt" >/dev/null
"$TMP_DIR/novacorp/scripts/server_health.sh" --output "$TMP_DIR/novacorp/reports/server_health.txt" >/dev/null
"$TMP_DIR/novacorp/scripts/backup_novacorp.sh" --source "$TMP_DIR/novacorp/data" --destination "$TMP_DIR/novacorp/backup" --log "$TMP_DIR/novacorp/logs/backup.log" >/dev/null
"$TMP_DIR/novacorp/scripts/check_disk.sh" --threshold 99 --log "$TMP_DIR/novacorp/logs/disk.log" >/dev/null || true

NOVACORP_HOME="$TMP_DIR/novacorp" "$TMP_DIR/novacorp/scripts/admin_toolkit.sh" report >/dev/null

[ -s "$TMP_DIR/novacorp/reports/user_report.txt" ]
[ -s "$TMP_DIR/novacorp/reports/log_report.txt" ]
[ -s "$TMP_DIR/novacorp/reports/server_health.txt" ]
ls "$TMP_DIR/novacorp/backup"/*.tar.gz >/dev/null
ls "$TMP_DIR/novacorp/reports"/admin_report_*.txt >/dev/null

echo "[4/4] OK"
