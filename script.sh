#!/bin/bash

#интервал
INTERVAL=5
LOGFILE="monitor.log"

echo "Мониторинг запущен, интервал $INTERVAL сек"

while true; do
    echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---" >> "$LOGFILE"
    free -h >> "$LOGFILE"
    df -h >> "$LOGFILE"
    uptime >> "$LOGFILE"
    echo >> "$LOGFILE"
    sleep "$INTERVAL"
done
