#!/data/data/com.termux/files/usr/bin/bash

. "$(dirname "$0")/common.sh"

clear
echo "========================================"
echo "           ROM ANALYZER"
echo "========================================"
echo

need_cmd unzip || {
    echo "Install with:"
    echo "pkg install unzip"
    exit 1
}

printf "Enter ROM ZIP path: "
read -r ROM

if [ ! -f "$ROM" ]; then
    echo "❌ ROM file not found."
    exit 1
fi

case "$ROM" in
    *.zip|*.ZIP) ;;
    *)
        echo "❌ ROM must be a ZIP file."
        exit 1
        ;;
esac

echo
echo "[1/4] Checking ZIP integrity..."

if unzip -t "$ROM" >/dev/null 2>&1; then
    echo "✅ PASS"
else
    echo "❌ ZIP is corrupted."
    exit 1
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

unzip -Z1 "$ROM" > "$TMP/files"

echo
echo "[2/4] Searching for MTK scatter..."

SCATTER="$(grep -Ei '(^|/)[^/]*scatter[^/]*\.txt$' "$TMP/files" | head -n 1)"

if [ -n "$SCATTER" ]; then
    echo "✅ Scatter found:"
    echo "   $SCATTER"
else
    echo "⚠️ No scatter file found."
fi

echo
echo "[3/4] Firmware files"

grep -Ei '\.(img|bin|elf|mbn|dtbo|vbmeta|lz4)$' "$TMP/files" |
    head -n 100

echo
echo "[4/4] Firmware type"

if [ -n "$SCATTER" ]; then
    echo "MTK SCATTER FIRMWARE"
else
    echo "UNKNOWN / OTHER FORMAT"
fi

echo
echo "========================================"
echo "READ-ONLY ANALYSIS COMPLETE"
echo "========================================"
