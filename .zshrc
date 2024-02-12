# Path to your oh-my-zsh installation.
export ZSH="/home/mathix/.oh-my-zsh"

ZSH_THEME="af-mathix"


autoload -U colors && colors
autoload -U compinit && compinit

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


# NVM / NPM / NODE
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# https://github.com/Sparragus/zsh-auto-nvm-use
# plugins+=(zsh-auto-nvm-use)

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
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="/home/mathix/.local/bin:$PATH"

export PATH="/flutter/flutter/bin:$PATH"

# golang
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

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
export USER='agissing'
export MAIL='agissing@student.42.fr'

alias emacs='emacsclient -t'
alias open='xdg-open'
alias slack='/opt/google/chrome/google-chrome --app="https://pulsar-systems.slack.com/"'
alias sudo='sudo '

alias mf-gen="/bin/sh ~/42-utilities/update.sh; python3 ~/42-utilities/mf-gen.py"
alias proto-list="/bin/sh ~/42-utilities/update.sh; sh ~/42-utilities/proto-list.sh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# fnm
export PATH=/home/mathix/.fnm:$PATH
eval "`fnm env --use-on-cd`"

export SUDO_EDITOR="emacsclient"
alias autoremove="sudo pacman -Qdtq | sudo pacman -Rs -"
alias warp-connect="warp-cli connect && sleep 2 && sudo systemctl restart systemd-resolved && warp-cli -l status"

# OBS fix
export QT_QPA_PLATFORM=wayland
