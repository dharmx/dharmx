export OSH=$HOME/.oh-my-bash

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
  alias nfk="neofetch --source $($XDG_CONFIG_HOME/neofetch/randomize.sh $XDG_CONFIG_HOME/neofetch/paths.txt) --backend kitty"
    alias nf="neofetch --source $($XDG_CONFIG_HOME/neofetch/randomize.sh $XDG_CONFIG_HOME/neofetch/paths.txt) --backend w3m"
    alias pf="neofetch --config $XDG_CONFIG_HOME/neofetch/config-minimal.conf --ascii $XDG_CONFIG_HOME/neofetch/arch-smol"
    alias uwuf="neofetch --config $XDG_CONFIG_HOME/neofetch/config-minimal-uwu.conf --ascii $XDG_CONFIG_HOME/neofetch/uwu-hd"
fi

if [ -x "$(command -v ripgrep)" ]; then
    alias grep="ripgrep"
fi

if [ -x "$(command -v go-mtpfs)" ]; then
    alias mount-phone="go-mtpfs ~/Phone"
fi

if [ -x "$(command -v fusermount)" ]; then
    alias umount-phone="fusermount -u ~/Phone"
fi

if [ -x "$(command -v udisksctl)" ]; then
    alias mount-ssd="udisksctl mount -b /dev/nvme0n1p1"
fi

if [ -x "$(command -v udisksctl)" ]; then
    alias unmount-ssd="udisksctl unmount -b /dev/nvme0n1p1"
fi

if [ -x "$(command -v betterlockscreen)" ]; then
    alias lock="betterlockscreen -l"
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

alias pipes1="$HOME/Dotfiles/lambda-scripts/aesthetic/pipes1"
alias pipes2="$HOME/Dotfiles/lambda-scripts/aesthetic/pipes2"
alias pipes2-slim="$HOME/Dotfiles/lambda-scripts/aesthetic/pipes2-slim"
alias rain="$HOME/Dotfiles/lambda-scripts/aesthetic/rain"

export PATH="$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$HOME/.jdks/jdk-16.0.1/bin:$HOME/.bin:$HOME/.local/bin:$PATH"
export VISUAL=nvim;
export EDITOR=nvim;
export PS2="❯ "
export HISTCONTROL=ignoreboth
# export LD_PRELOAD=/usr/lib/libwcwidth-icons.so

SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
unset JDK_JAVA_OPTIONS
alias java='java "$SILENT_JAVA_OPTIONS"'

colorscript exec bars

. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

