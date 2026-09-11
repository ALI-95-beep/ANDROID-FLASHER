#!/data/data/com.termux/files/usr/bin/bash

set -e

BASE="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"

echo "========================================"
echo "        ANDROIDFLASHER INSTALLER"
echo "========================================"
echo

echo "[1/3] Checking Termux..."

if [ ! -d "/data/data/com.termux/files/usr" ]; then
    echo "❌ This installer is designed for Termux."
    exit 1
fi

echo "✅ Termux detected."

echo
echo "[2/3] Setting permissions..."

chmod +x "$BASE/AndroidFlasher.sh"
chmod +x "$BASE"/core/*.sh

echo "✅ Permissions configured."

echo
echo "[3/3] Checking dependencies..."

if command -v adb >/dev/null 2>&1; then
    echo "✅ ADB found."
else
    echo "⚠️ ADB not found."
    echo "Install it with:"
    echo "pkg install android-tools"
fi

if command -v unzip >/dev/null 2>&1; then
    echo "✅ unzip found."
else
    echo "⚠️ unzip not found."
    echo "Install it with:"
    echo "pkg install unzip"
fi

echo
echo "========================================"
echo "      INSTALLATION COMPLETE"
echo "========================================"
echo
echo "Start AndroidFlasher with:"
echo
echo "  ./AndroidFlasher.sh"
echo
chmod +x install.sh
./install.sh
