#!/data/data/com.termux/files/usr/bin/bash

. "$(dirname "$0")/common.sh"

need_cmd adb || exit 1

SERIAL="$(get_adb_device)"

if [ -z "$SERIAL" ]; then
    echo "❌ No authorized Android device."
    exit 1
fi

clear
echo "========================================"
echo "        DEVICE INFORMATION"
echo "========================================"
echo

for PROP in \
    ro.product.manufacturer \
    ro.product.model \
    ro.product.device \
    ro.build.product \
    ro.hardware \
    ro.boot.hardware \
    ro.build.version.release \
    ro.build.display.id \
    ro.build.version.incremental
do
    VALUE="$(adb -s "$SERIAL" shell getprop "$PROP" | tr -d '\r')"
    printf "%-30s %s\n" "$PROP" "$VALUE"
done
