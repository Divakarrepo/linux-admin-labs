#!/bin/bash

echo "========== Daily Automatic backup ==========="

source="$HOME/linux-lab"
dest="$HOME/backup"
Date=$(date +%y-%m-%d_%H:%M:%S)

mkdir -p "$dest"

tar -czf "$dest/linux-lab-backup-$Date.tar.gz" -C "$HOME" linux-lab

echo "Backup completed: $dest/linux-lab-backup-$Date.tar.gz"

echo "List of Backeuped files: $(ls -lh $dest)"

echo "============================================="
