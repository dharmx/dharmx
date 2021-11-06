# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/maker/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    # aliases
    # alias-finder
    # archlinux
    # battery
    # catimg
    colored-man-pages
    colorize
    # command-not-found
    # common-aliases
    # copydir
    # copyfile
    # cp
    # extract
    # geeknote
    # git-extras
    history
    # history-substring-search
    man
    # node
    # npm
    # pip
    # python
    # sudo
    zsh-syntax-highlighting 
    zsh-autosuggestions
    zsh-autocomplete
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
    alias la="exa --long --all --group"
    alias li="exa --long --all --group --icons"
fi

if [ -x "$(command -v logo-ls)" ]; then
    alias lls="logo-ls"
    alias lla="logo-ls -l --all"
fi

if [ -x "$(command -v neofetch)" ]; then
    alias nf="neofetch --source $(~/.config/neofetch/randomize.sh ~/.config/neofetch/paths.txt) --backend w3m --loop"
    alias nfk="neofetch --config /home/maker/.config/neofetch/config-kitty.conf --source $(~/.config/neofetch/randomize.sh ~/.config/neofetch/paths.txt) --backend kitty --xoffset 25 --yoffset 17 --gap 40"
    alias nft="neofetch --ascii ~/.config/neofetch/date-a-live"
    alias pf="neofetch --config /home/maker/.config/neofetch/config-minimal.conf --ascii ~/.config/neofetch/arch-hi-res-smol"
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

alias logout="killall bspwm"
alias suspend="systemctl suspend"
alias pac="sudo pacman"
alias cls="clear"

alias pipes1="~/Templates/stark-color-scripts/color-scripts/pipes1"
alias pipes2="~/Templates/stark-color-scripts/color-scripts/pipes2"
alias pipes2-slim="~/Templates/stark-color-scripts/color-scripts/pipes2-slim"
alias rain="~/Templates/custom-color-scripts/rain"

# wal -q --theme base16-nordocean
# wal -q --theme base16-dale

export VISUAL=nvim;
export EDITOR=nvim;
export PATH="/home/maker/.local/share/gem/ruby/3.0.0/bin:/home/maker/.jdks/jdk-16.0.1/bin:/home/maker/.bin:/home/maker/.local/bin:$PATH"
export PS2="❯ "

SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
unset JDK_JAVA_OPTIONS
alias java='java "$SILENT_JAVA_OPTIONS"'

setopt HIST_IGNORE_ALL_DUPS

clear
# colorscript exec crunchbang-mini
# colorscript exec crunch
/home/maker/Templates/custom-color-scripts/crunch-mini
printf "\n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

