#!/data/data/com.termux/files/usr/bin/bash

. "$(dirname "$0")/common.sh"

clear
echo "========================================"
echo "        ANDROIDFLASHER"
echo "        DEVICE DETECTION"
echo "========================================"
echo

need_cmd adb || {
    echo
    echo "Install ADB with:"
    echo "pkg install android-tools"
    exit 1
}

echo "Waiting for target..."
echo

SERIAL="$(get_adb_device)"

if [ -z "$SERIAL" ]; then
    echo "❌ No authorized Android device."
    echo
    echo "Check:"
    echo "  • USB OTG"
    echo "  • USB debugging"
    echo "  • Target unlocked"
    echo "  • USB debugging authorization"
    exit 1
fi

echo "✅ DEVICE CONNECTED"
echo
echo "Serial       : $SERIAL"
echo "Manufacturer : $(adb -s "$SERIAL" shell getprop ro.product.manufacturer | tr -d '\r')"
echo "Model        : $(adb -s "$SERIAL" shell getprop ro.product.model | tr -d '\r')"
echo "Device       : $(adb -s "$SERIAL" shell getprop ro.product.device | tr -d '\r')"
echo "Product      : $(adb -s "$SERIAL" shell getprop ro.build.product | tr -d '\r')"
echo "Android      : $(adb -s "$SERIAL" shell getprop ro.build.version.release | tr -d '\r')"
echo "Hardware     : $(adb -s "$SERIAL" shell getprop ro.hardware | tr -d '\r')"
echo "Build        : $(adb -s "$SERIAL" shell getprop ro.build.display.id | tr -d '\r')"

log "Device detected: $SERIAL"
