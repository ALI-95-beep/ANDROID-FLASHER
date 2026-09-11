#!/data/data/com.termux/files/usr/bin/bash

BASE="${ANDROIDFLASHER_BASE:-$HOME/AndroidFlasher}"
LOGDIR="$BASE/logs"

mkdir -p "$LOGDIR"

log() {
    printf '[%s] %s\n' "$(date '+%F %T')" "$*" \
        >> "$LOGDIR/androidflasher.log"
}

need_cmd() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "❌ Missing dependency: $1"
        return 1
    fi
}

get_adb_device() {
    adb start-server >/dev/null 2>&1
    adb devices |
        awk 'NR>1 && $2=="device" {print $1; exit}'
}
