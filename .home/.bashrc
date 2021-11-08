export OSH=/home/maker/.oh-my-bash

OSH_THEME="kitsune"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

completions=(git composer)
aliases=(general chmod ls misc)
plugins=(git bashmarks battery progress)

source $OSH/oh-my-bash.sh

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

alias pipes1="/home/maker/Dotfiles/lambda-scripts/aesthetic/pipes1"
alias pipes2="/home/maker/Dotfiles/lambda-scripts/aesthetic/pipes2"
alias pipes2-slim="/home/maker/Dotfiles/lambda-scripts/aesthetic/pipes2-slim"
alias rain="/home/maker/Dotfiles/lambda-scripts/aesthetic/rain"

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
