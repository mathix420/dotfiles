# dotfiles

Personal Arch Linux desktop configuration. The root files follow the primary
machine; [`hosts/arch-framework`](hosts/arch-framework) contains the Framework
laptop overrides. Copy only the files you need and back up existing settings first.

The desktop uses custom SwayFX, Alacritty/Alacritree, Rofi, Mako, and i3status-rust.
The root shell and editor settings are optional; the Framework profile keeps Bash
and does not install development tools.

The root status bar's Linear and WakaTime helpers read credentials from environment
variables or ignored local files. They contain no embedded credentials. Personal
Sway shortcuts, including Home Assistant webhooks, belong in the ignored
`~/.config/sway/local.d/` directory. Keep private credentials outside this repository.

## Before committing

Install [Gitleaks](https://github.com/gitleaks/gitleaks), then enable the tracked hook:

```sh
git config core.hooksPath .githooks
gitleaks dir . --redact --no-banner
```

The hook scans staged changes with the default Gitleaks rules plus Home Assistant
webhook and SponsorBlock private-ID rules. Its only custom exception is for keyboard chords in VS Code's
keybindings file. Review the staged diff as well; automated scanning is not a
guarantee that every possible secret format will be detected.

Historically tracked editor dependencies remain for compatibility. Avoid adding
runtime caches, shell history, browser profiles, credentials, or private keys.
Previously committed credentials must be revoked or rotated even after removal
from the latest tree; old commits can still contain them.

The older backup mapping is in [sav.yml](.config/sav.yml), used by
[sav.py](https://github.com/mathix420/utilities/blob/master/sav/sav.py). Review its
output before committing; some mappings cover directories with runtime state.
