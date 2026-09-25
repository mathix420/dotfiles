# Framework laptop desktop

Desktop-only overrides for the Framework Laptop 13 Pro (Intel Core Ultra Series 3).
Use `home/` as an overlay on the user's home directory, backing up existing files.
Do not apply the root Zsh or editor configurations as part of this profile.

Preserved settings: US keyboard, 2880×1920 at 120 Hz and scale 2, default touchpad
behavior, Bash, NetworkManager with iwd, UFW, and the balanced power profile.
The profile does not modify boot, storage, or login-manager settings.

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
