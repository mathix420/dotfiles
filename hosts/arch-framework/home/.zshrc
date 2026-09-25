# Path to your oh-my-zsh installation.
export ZSH="/home/mathix/.oh-my-zsh"

# source /home/mathix/.secrets

ZSH_THEME="af-mathix"


echo "
   __  ______ ________ _______  __  __
  /  |/  / _ /_  __/ // /  _/ |/_/ / /____ ______ _
 / /|_/ / __ |/ / / _  // /_>  <  / __/ -_) __/  ' \\
/_/  /_/_/ |_/_/ /_//_/___/_/|_|  \\__/\\__/_/ /_/_/_/

"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws)

# OH MY ZSH
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
    pyenv commands | grep -qx virtualenv-init && eval "$(pyenv virtualenv-init -)"
fi

export PATH="/home/mathix/.local/bin:$PATH"

export PATH="/flutter/flutter/bin:$PATH"

# golang
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export TSC7_CHECKERS=4

# adb
export PATH="/opt/android-sdk/platform-tools:$PATH"

# Virtual envs
#. /usr/local/bin/virtualenvwrapper.sh

#dropcontact
export DEVELOPPER='YES'

#less colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export EDITOR='emacsclient -t'
#export USER='agissing'
#export MAIL='agissing@student.42.fr'

alias emacs='emacsclient -t'
alias open='xdg-open'
alias slack='/opt/google/chrome/google-chrome --app="https://pulsar-systems.slack.com/"'
alias sudo='sudo '

alias mf-gen="/bin/sh ~/42-utilities/update.sh; python3 ~/42-utilities/mf-gen.py"
alias proto-list="/bin/sh ~/42-utilities/update.sh; sh ~/42-utilities/proto-list.sh"

if command -v terraform >/dev/null 2>&1; then
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /usr/bin/terraform terraform
fi

# fnm / node version manager
export PATH=/home/mathix/.fnm:$PATH
command -v fnm >/dev/null 2>&1 && eval "$(fnm env --use-on-cd)"

# node config
export NODE_OPTIONS="--max_old_space_size=4096"

export SUDO_EDITOR="emacsclient"
alias autoremove="sudo pacman -Qdtq | sudo pacman -Rs -"
alias warp-connect="warp-cli connect && sleep 2 && sudo systemctl restart systemd-resolved && warp-cli -l status"

# OBS fix
export QT_QPA_PLATFORM=wayland

# Zoxide
if [[ $- == *i* ]] && command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# pnpm
export PNPM_HOME="/home/mathix/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/mathix/.bun/_bun" ] && source "/home/mathix/.bun/_bun"

# Use an available editor until optional development tools are installed.
if ! command -v emacsclient >/dev/null 2>&1; then
    export EDITOR=vim SUDO_EDITOR=vim
fi
