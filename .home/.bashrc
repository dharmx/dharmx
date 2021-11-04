# Path to your oh-my-bash installation.
export OSH=/home/maker/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="kitsune"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
  chmod
  ls
  misc
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
  battery
  progress
)

source $OSH/oh-my-bash.sh

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

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"

if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
    alias la="exa --long --all --group"
fi

if [ -x "$(command -v neofetch)" ]; then
    alias nfk="neofetch --source $(~/.config/neofetch/randomize.sh ~/.config/neofetch/paths.txt) --backend kitty"
    alias nf="neofetch --source $(~/.config/neofetch/randomize.sh ~/.config/neofetch/paths.txt) --backend w3m"
    alias pf="neofetch --config /home/maker/.config/neofetch/config-minimal.conf --ascii ~/.config/neofetch/arch-smol"
    alias uwuf="neofetch --config /home/maker/.config/neofetch/config-minimal-uwu.conf --ascii ~/.config/neofetch/uwu-hd"
fi

if [ -x "$(command -v ripgrep)" ]; then
    alias grep="ripgrep"
fi

if [ -x "$(command -v go-mtpfs)" ]; then
    alias mount-phone="go-mtpfs ~/phone"
fi

if [ -x "$(command -v fusermount)" ]; then
    alias umount-phone="fusermount -u ~/phone"
fi

if [ -x "$(command -v betterlockscreen)" ]; then
    alias lock="betterlockscreen -l dim --off 5"
fi

# if [ -x "$(command -v vim)" ]; then
#     alias vi="vim"
# fi

if [ -x "$(command -v nvim)" ]; then
    alias nv="nvim"
fi

if [ -x "$(command -v ranger)" ]; then
    alias fm="ranger"
fi    

alias logout="killall i3; killall bspwm"
alias suspend="systemctl suspend"
alias pac="sudo pacman"
alias cls="clear"

alias pipes1="~/Templates/stark-color-scripts/color-scripts/pipes1"
alias pipes2="~/Templates/stark-color-scripts/color-scripts/pipes2"
alias pipes2-slim="~/Templates/stark-color-scripts/color-scripts/pipes2-slim"
alias rain="~/Templates/custom-color-scripts/rain"

# wal -q --theme base16-nordocean
# wal -q --theme base16-dale

export PATH="/home/maker/.local/share/gem/ruby/3.0.0/bin:/home/maker/.jdks/jdk-16.0.1/bin:/home/maker/.bin:/home/maker/.local/bin:$PATH"
export VISUAL=nvim;
export EDITOR=nvim;
export PS2=" "
export HISTCONTROL=ignoreboth

SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
unset JDK_JAVA_OPTIONS
alias java='java "$SILENT_JAVA_OPTIONS"'

clear
colorscript exec bars

. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

