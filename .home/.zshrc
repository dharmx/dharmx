if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/maker/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# aliases
# alias-finder
# archlinux
# battery
# catimg
# command-not-found
# common-aliases
# copydir
# copyfile
# cp
# extract
# geeknote
# git-extras
# history-substring-search
# node
# npm
# pip
# python
# sudo
plugins=(
    git
    colored-man-pages
    colorize
    history
    man
    zsh-syntax-highlighting 
    zsh-autosuggestions
    zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

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

alias pipes1="/home/maker/Dotfiles/lambda-scripts/aesthetic/pipes1"
alias pipes2="/home/maker/Dotfiles/lambda-scripts/aesthetic/pipes2"
alias pipes2-slim="/home/maker/Dotfiles/lambda-scripts/aesthetic/pipes2-slim"
alias rain="/home/maker/Dotfiles/lambda-scripts/aesthetic/rain"

export VISUAL=nvim;
export EDITOR=nvim;
export PATH="/home/maker/.local/share/gem/ruby/3.0.0/bin:/home/maker/.jdks/jdk-16.0.1/bin:/home/maker/.bin:/home/maker/.local/bin:$PATH"
export PS2="❯ "

SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
unset JDK_JAVA_OPTIONS
alias java='java "$SILENT_JAVA_OPTIONS"'

setopt HIST_IGNORE_ALL_DUPS

clear
/home/maker/Dotfiles/lambda-scripts/aesthetic/crunch-mini
printf "\n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
