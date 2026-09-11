#!/data/data/com.termux/files/usr/bin/bash

clear
echo "========================================"
echo "         BACKUP / RESTORE"
echo "========================================"
echo
echo "1. ADB backup"
echo "2. ADB restore"
echo "0. Back"
echo

printf "Select: "
read -r CHOICE

mkdir -p "$HOME/AndroidFlasher/backups"

case "$CHOICE" in
    1)
        echo "Creating ADB backup..."
        adb backup -apk -shared -all \
            -f "$HOME/AndroidFlasher/backups/device.ab"
        ;;
    2)
        if [ -f "$HOME/AndroidFlasher/backups/device.ab" ]; then
            adb restore "$HOME/AndroidFlasher/backups/device.ab"
        else
            echo "❌ No backup found."
        fi
        ;;
esac
