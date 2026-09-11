#!/data/data/com.termux/files/usr/bin/bash

. "$(dirname "$0")/common.sh"

need_cmd adb || exit 1

SERIAL="$(get_adb_device)"

if [ -z "$SERIAL" ]; then
    echo "❌ No authorized device."
    exit 1
fi

echo "Rebooting $SERIAL..."
adb -s "$SERIAL" reboot
