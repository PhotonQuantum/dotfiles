#  If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/lightquantum/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
plugins=(
  # zsh-autosuggestions
  z
  git
  sudo
  copybuffer
  copyfile
  python
  cp
  extract
  screen
  supervisor
  pip
  systemd
  zsh-syntax-highlighting
  colored-man-pages
  git-extras
  github
  git-remote-branch
  # vi-mode
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias -g vim="nvim"
alias -g vim="px nvim"
alias -g spx="sudo proxychains -q"
alias -g px="proxychains -q"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
alias reproxy="sudo killall ss-local"
alias timesync="sudo ntpd -qg"
alias batt="cat /sys/class/power_supply/BAT0/capacity"

alias -g jsonprettify="python -m json.tool"

alias -g feh-auto="feh --scale-down --auto-zoom"

alias -g yay="HTTP_PROXY='http://localhost:8888' yay --pacman powerpill --nodiffmenu --noeditmenu"

alias -g pacman="powerpill"

alias l="lsd -lha"
alias ls="lsd"

alias venv="source ./.venv/bin/activate"
alias create_venv="python -m venv .venv"

alias yay_git="pacman -Qmq | grep -Ee '-(cvs|svn|git|hg|bzr|darcs)$' | HTTP_PROXY='http://localhost:8888' yay -S --needed -"
alias yay_upg="HTTP_PROXY='http://localhost:8888' yay -Syu --devel --useask --noeditmenu --nodiffmenu --answerdiff=None --noconfirm"
alias yay_upg_confirm="HTTP_PROXY='http://localhost:8888' yay -Syu --devel --noeditmenu --nodiffmenu --answerdiff=None"

export EDITOR=nvim
export VISUAL=nvim

alias -g card_key="0x019DF3ECDFB72A60!"
alias -g phone_key="0xE3BAFA554E141A99!"

# alias sysyadm="GPG_TTY=$(tty) sudo --preserve-env=GPG_TTY yadm -Y /etc/yadm"
# alias usryadm="sudo yadm -Y /usr/yadm"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# git config --global user.name "PhotonQuantum"
# git config --global user.email "cy.n01@outlook.com"
# git config --global user.signingkey 145D458B467A0318
# git config --global commit.gpgsign true
# git config --global http.proxy socks5://127.0.0.1:8889
# git config --global https.proxy socks5://127.0.0.1:8889
# git config --global hub.protocol https

alias pbpst="pbpst -P https://fars.ee"
alias xclip="xclip -selection clipboard"

alias -g rm="rmtrash"
alias -g rmdir="rmdirtrash"

alias t="todo.sh"

alias s="sudo systemctl suspend"
alias p="sudo systemctl poweroff"
alias h="sudo systemctl hibernate"

# boincmode never
# boinccpu 20.0 25.0
prompt_context(){
  DEFAULT_USER="LightQuantum"
}
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

alias lvm-apply="sudo lvremove vgArch/snap-root"
alias lvm-revert="sudo lvconvert --merge vgArch/snap-root && echo \"Reboot required\""

unalias gl

alias please="sudo"
