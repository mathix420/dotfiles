# Framework laptop desktop

Desktop-only overrides for the Framework Laptop 13 Pro (Intel Core Ultra Series 3).
Use `home/` as an overlay on the user's home directory, backing up existing files.
The profile includes the personal Zsh/Oh My Zsh prompt with optional development-tool initialization guarded; it does not install development tools or editor configurations.

Preserved settings: US keyboard, 2880×1920 at 120 Hz and scale 1, default touchpad
behavior, Zsh with the af-mathix theme, NetworkManager with iwd, UFW, and the balanced power profile.
The greeter uses the repository’s original Chili theme through SDDM’s Qt 5 greeter. GRUB uses a hidden menu with zero delay and selects the named `arch-framework-uki` entry. It chainloads `/boot/EFI/Linux/arch-linux.efi`, the laptop’s unified kernel image (UKI), preserving its embedded kernel command line. Storage and firmware settings are unchanged.

The installed compositor matches the primary machine:

- `swayfx-i3-style-fullscreen-git` 0.5.3-1
- `scenefx0.4` 0.4.1-2
- `wlroots0.19` 0.19.3-1

These packages came from the primary machine's verified package archives. Current
AUR packages may use different versions. Standard Sway cannot parse the blur and
corner-radius directives in this profile.

The bar shows temperature, Wi-Fi, sound, time, and battery. Super+Space opens Rofi,
Super+Return opens Alacritty, Super+E opens Nautilus, Super+W opens the NetworkManager
connection editor, Super+B opens Bluetooth settings, and Super+Escape locks the
screen. Print captures a selected area to the clipboard. Locking also runs before
suspend. Personal account integrations are omitted.

Copy `wallpapers/ray-of-lights.png` and `wallpapers/wallhaven.png` from the repository
root to `~/wallpapers/`. The configuration currently targets `/home/mathix`.
Check `packages.txt` for the desktop dependencies; install them using a complete
Arch update before applying this overlay. Start a fresh Sway session after replacing
the compositor. A configuration reload alone cannot switch standard Sway to SwayFX.

Rofi 2.0.0 on this laptop crashes in the cleanup path of `-rasi-validate`, even for
a minimal config. Normal launcher startup and `-dump-config` were verified.

The bar uses a 32-pixel height and 11-point font at display scale 1. Inner gaps are 10 pixels. Rofi and Alacritty use the original repository font settings at native display scale. Install Oh My Zsh at `~/.oh-my-zsh`, then overlay the included `af-mathix` theme.

System overrides are in `etc/`. Copy the root repository’s `usr/share/sddm/themes/chili` to `/usr/share/sddm/themes/chili`, install the Qt 5 runtime dependencies from `packages.txt`, and enable the supplied SDDM theme override. Greeter preview: `sddm-greeter --test-mode --theme /usr/share/sddm/themes/chili`.

For GRUB, first verify that `/boot` is mounted and the working UKI exists at `/boot/EFI/Linux/arch-linux.efi`. Back up `/etc/default/grub`, `/boot/grub/grub.cfg`, and any existing custom generator. Install `etc/grub.d/09_framework_uki` at `/etc/grub.d/09_framework_uki` with mode 755, then merge `grub-settings.conf` into `/etc/default/grub`, preserving other settings. The generator discovers the boot filesystem UUID locally; no disk identifiers are stored in this profile.

Generate a candidate configuration with `grub-mkconfig -o /boot/grub/grub.cfg.new` and check it with `grub-script-check`. Before replacing the active configuration, also verify that the named default is `arch-framework-uki`, its menu entry selects the correct boot filesystem, and it chainloads `/EFI/Linux/arch-linux.efi`. Syntax checking alone does not establish that an entry can boot.

This installation generates a UKI rather than a standalone `initramfs-linux.img`. GRUB’s conventional `10_linux` generator can still produce an unusable entry loading only `vmlinuz-linux` and `intel-ucode.img`. Keep the explicit named UKI default; choosing that conventional entry causes a root-filesystem panic. For manual recovery at a GRUB prompt, locate the boot filesystem with `search --file --set=root /EFI/Linux/arch-linux.efi`, then run `chainloader /EFI/Linux/arch-linux.efi` and `boot`.
