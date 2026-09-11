#!/data/data/com.termux/files/usr/bin/bash

. "$(dirname "$0")/common.sh"

clear
echo "========================================"
echo "        INSTALL STOCK ROM"
echo "========================================"
echo
echo "1. Connect target"
echo "2. Select ROM"
echo "3. Analyze ROM"
echo "4. Check compatibility"
echo "5. Confirm"
echo "6. Flash"
echo "7. Verify"
echo "8. Reboot"
echo

printf "ROM ZIP path: "
read -r ROM

if [ ! -f "$ROM" ]; then
    echo "❌ ROM not found."
    exit 1
fi

echo
echo "Analyzing ROM..."
printf '%s\n' "$ROM" | "$BASE/core/rom_analyzer.sh"

echo
echo "========================================"
echo "FLASH SAFETY CHECK"
echo "========================================"
echo
echo "⚠️ No supported MTK flashing backend is"
echo "currently configured."
echo
echo "AndroidFlasher will NOT blindly write"
echo "scatter partitions."
echo
echo "Flash operation BLOCKED safely."
