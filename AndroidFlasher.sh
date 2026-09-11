#!/data/data/com.termux/files/usr/bin/bash

BASE="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"
export ANDROIDFLASHER_BASE="$BASE"

while true; do
    clear
    echo "========================================"
    echo "           ANDROIDFLASHER"
    echo "========================================"
    echo
    echo "1. Install Stock ROM"
    echo "2. Bootloader Manager"
    echo "3. Detect Device"
    echo "4. Device Information"
    echo "5. Backup / Restore"
    echo "6. ROM Analyzer"
    echo "7. Verify Flash"
    echo "8. Reboot Device"
    echo "9. Settings"
    echo "0. Exit"
    echo
    printf "Select option: "
    read -r choice

    case "$choice" in
        1) "$BASE/core/install_stock_rom.sh" ;;
        2) "$BASE/core/bootloader_manager.sh" ;;
        3) "$BASE/core/detect_target.sh" ;;
        4) "$BASE/core/device_info.sh" ;;
        5) "$BASE/core/backup_restore.sh" ;;
        6) "$BASE/core/rom_analyzer.sh" ;;
        7) "$BASE/core/verify_flash.sh" ;;
        8) "$BASE/core/reboot_device.sh" ;;
        9) "$BASE/core/settings.sh" ;;
        0) clear; echo "AndroidFlasher closed."; exit 0 ;;
        *) echo "Invalid option."; sleep 1 ;;
    esac

    echo
    read -r -p "Press ENTER to return to menu..."
done
