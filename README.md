# AndroidFlasher

**AndroidFlasher** is a Termux-based Android device and stock ROM management tool designed to make Android maintenance easier from a mobile device.

> ⚠️ **Current status:** AndroidFlasher is under development. The flashing backend is currently safety-blocked and does **not** perform blind MTK partition writes.

## ✨ Features

* 📱 Detect Android devices through ADB
* ℹ️ Display device information
* 📦 Analyze stock ROM ZIP files
* 🔍 Detect MTK scatter firmware
* 🔐 Bootloader management
* 💾 Backup and restore
* ✅ Flash verification
* 🔄 Reboot connected devices
* 📝 Logging
* 🛡️ Safety checks before flashing

## 📋 Requirements

* Android phone
* Termux
* Git
* Android platform tools
* USB OTG when using another Android phone as the host
* USB debugging enabled on the target device

## 🚀 Installation

### 1. Update Termux

```bash
pkg update
pkg upgrade
```

### 2. Install Git

```bash
pkg install git
```

### 3. Clone AndroidFlasher

```bash
git clone https://github.com/ALI-95-beep/ANDROID-FLASHER.git
```

### 4. Enter the project

```bash
cd ANDROID-FLASHER
```

### 5. Run the installer

```bash
chmod +x install.sh
./install.sh
```

### 6. Start AndroidFlasher

```bash
./AndroidFlasher.sh
```

## 📱 Main Menu

```text
1. Install Stock ROM
2. Bootloader Manager
3. Detect Device
4. Device Information
5. Backup / Restore
6. ROM Analyzer
7. Verify Flash
8. Reboot Device
9. Settings
0. Exit
```

## 🔌 Device Detection

For ADB detection:

1. Connect the target Android device using USB OTG.
2. Enable USB debugging on the target.
3. Unlock the target device.
4. Accept the USB debugging authorization prompt.
5. Open AndroidFlasher.
6. Select **Detect Device**.

## 📦 ROM Analyzer

ROM Analyzer can inspect a ROM ZIP and check for:

* ZIP integrity
* MTK scatter files
* Firmware images
* Firmware binaries
* Other common firmware components

The analyzer is read-only and does not modify the ROM.

## 🛡️ Flashing Safety

AndroidFlasher does **not** bypass:

* Bootloader security
* Secure Boot
* Vendor authorization
* Device authentication
* Other manufacturer security protections

Unsupported or unverified flashing operations are blocked instead of performing blind partition writes.

Always use firmware intended for the exact device model and hardware variant.

A wrong firmware or flashing procedure can permanently damage a device.

## ⚙️ Supported Devices

AndroidFlasher is being developed with MediaTek Android devices in mind.

### Development target

* TECNO Spark 10 Pro
* Model: TECNO KI7
* MediaTek MT6768
* Android 13

Support for additional devices is planned.

> Device support depends on the available firmware format and a compatible flashing backend.

## 🧪 Development Status

AndroidFlasher is currently in active development.

### Current

* [x] GitHub repository
* [x] Termux interface
* [x] Device detection
* [x] Device information
* [x] ROM analyzer
* [x] Bootloader tools
* [x] Backup / restore interface
* [x] Flash verification
* [x] Reboot tools
* [x] Installer
* [x] Safety checks

### Planned

* [ ] More device compatibility checks
* [ ] Improved ROM compatibility analysis
* [ ] Additional firmware formats
* [ ] Tested legitimate flashing backends
* [ ] Automatic post-flash verification
* [ ] Release builds

## 📂 Project Structure

```text
AndroidFlasher/
├── AndroidFlasher.sh
├── install.sh
├── VERSION
├── README.md
├── LICENSE
├── .gitignore
├── core/
│   ├── common.sh
│   ├── install_stock_rom.sh
│   ├── bootloader_manager.sh
│   ├── detect_target.sh
│   ├── device_info.sh
│   ├── backup_restore.sh
│   ├── rom_analyzer.sh
│   ├── verify_flash.sh
│   ├── reboot_device.sh
│   └── settings.sh
├── logs/
├── backups/
├── rom/
└── protocols/
```

## 🔄 Updating

If AndroidFlasher is already installed:

```bash
cd ANDROID-FLASHER
git pull
```

Then run:

```bash
./install.sh
```

## 🤝 Contributing

Contributions, bug reports, ideas, and testing are welcome.

Before testing firmware-related functionality, make sure you understand the risks and use firmware intended for the correct device.

## 📜 License

AndroidFlasher is released under the **MIT License**.

See [`LICENSE`](LICENSE) for the full license text.

## 👨‍💻 Project

**AndroidFlasher**

GitHub:

https://github.com/ALI-95-beep/ANDROID-FLASHER.git
