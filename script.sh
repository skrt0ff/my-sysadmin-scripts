#!/bin/bash

INTERVAL=5
LOGFILE="monitor.log"

if ! which free > /dev/null; then
    echo "Ошибка: команда free не найдена"
    exit 1
fi

if ! which df > /dev/null; then
    echo "Ошибка: команда df не найдена"
    exit 1
fi
if ! which uptime > /dev/null; then
    echo "Ошибка: команда uptime не найдена"
    exit 1
fi

if [ ! -w . ]; then
    echo "Ошибка: нет прав на запись в текущую папку"
    exit 1
fi

echo "Мониторинг запущен, интервал $INTERVAL сек"
echo "Остановка на Ctrl+C"

while true; do
    echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---" >> "$LOGFILE"
    free -h >> "$LOGFILE"
    df -h >> "$LOGFILE"
    uptime >> "$LOGFILE"
    echo >> "$LOGFILE"
    echo "записано в $LOGFILE"
    sleep "$INTERVAL"
done
