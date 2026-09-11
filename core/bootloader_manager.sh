#!/data/data/com.termux/files/usr/bin/bash

while true; do
    clear
    echo "========================================"
    echo "        BOOTLOADER MANAGER"
    echo "========================================"
    echo
    echo "1. Check bootloader status"
    echo "2. Reboot to bootloader"
    echo "3. Standard unlock command"
    echo "0. Back"
    echo

    printf "Select: "
    read -r CHOICE

    case "$CHOICE" in
        1)
            if ! command -v fastboot >/dev/null 2>&1; then
                echo "❌ fastboot is not installed."
                echo "Install with: pkg install android-tools"
            else
                fastboot getvar unlocked 2>&1
            fi
            read -r -p "Press ENTER..."
            ;;

        2)
            if command -v adb >/dev/null 2>&1; then
                adb reboot bootloader
            else
                echo "❌ ADB is not installed."
                read -r -p "Press ENTER..."
            fi
            ;;

        3)
            echo
            echo "⚠️ Standard bootloader unlocking can erase"
            echo "all user data."
            echo
            printf "Type UNLOCK to continue: "
            read -r CONFIRM

            if [ "$CONFIRM" = "UNLOCK" ]; then
                if command -v fastboot >/dev/null 2>&1; then
                    fastboot flashing unlock
                else
                    echo "❌ fastboot is not installed."
                fi
            else
                echo "Cancelled."
            fi

            read -r -p "Press ENTER..."
            ;;

        0)
            exit 0
            ;;

        *)
            echo "Invalid option."
            sleep 1
            ;;
    esac
done
