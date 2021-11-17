if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="simonoff"

# alias-finder archlinux battery catimg command-not-found common-aliases copydir copyfile 
# aliases cp extract geeknote git-extra history-substring-search python 
plugins=(
    git
    colored-man-pages
    colorize
    history
    man
    npm
    sudo
    archlinux
    pip
    node
    zsh-syntax-highlighting 
    zsh-autosuggestions
    zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

if [ -x "$(command -v exa)" ]; then
    # 'l' shows the contents + hidden ones including a header
    # 'll' just shows the contents including a header
    alias li="exa --long --all --group --icons"
    alias ls="exa"
    alias la="exa --long --all --group"
fi

if [ -x "$(command -v logo-ls)" ]; then
    alias lls="logo-ls"
    alias lla="logo-ls -l --all"
fi

if [ -x "$(command -v neofetch)" ]; then
    alias nf="neofetch --config $XDG_CONFIG_HOME/neofetch/main-config.conf --source $($XDG_CONFIG_HOME/neofetch/randomize.sh $XDG_CONFIG_HOME/neofetch/paths.txt) --backend w3m"
    alias nfk="neofetch --config $XDG_CONFIG_HOME/neofetch/main-config.conf --source $($XDG_CONFIG_HOME/neofetch/randomize.sh $XDG_CONFIG_HOME/neofetch/paths.txt) --backend kitty --xoffset 25 --yoffset 20 --gap 40"
    alias nfb="neofetch --config $XDG_CONFIG_HOME/neofetch/config-minimal-bars.conf --ascii $XDG_CONFIG_HOME/neofetch/bonsai"
    alias pf="neofetch --config $XDG_CONFIG_HOME/neofetch/config-minimal.conf --ascii $XDG_CONFIG_HOME/neofetch/arch-hi-res-smol"
    alias uwuf="neofetch --config $XDG_CONFIG_HOME/neofetch/config-minimal-uwu.conf --ascii $XDG_CONFIG_HOME/neofetch/uwu-hd"
fi

if [ -x "$(command -v ripgrep)" ]; then
    alias grep="ripgrep"
fi

if [ -x "$(command -v go-mtpfs)" ]; then
    alias mount-phone="go-mtpfs $HOME/Phone"
fi

if [ -x "$(command -v fusermount)" ]; then
    alias unmount-phone="fusermount -u $HOME/Phone"
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

alias logout="killall bspwm"
alias suspend="systemctl suspend"
alias pac="sudo pacman"
alias commit="git add . && git commit -m"
alias clone="git clone"
alias push="git push"
alias pull="git pull"
alias cls="clear"

alias pipes1="lam -e pipes1"
alias pipes2="lam -e pipes2"
alias pipes2-slim="lam -e pipes2-slim"
alias rain="lam -e rain"

alias cat="ccat"
alias less="cless"

export VISUAL=nvim;
export EDITOR=nvim;
export PATH="$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$HOME/.jdks/jdk-16.0.1/bin:$HOME/.local/bin:$PATH"
export PS2="%2F%3F "
# export LD_PRELOAD=/usr/lib/libwcwidth-icons.so

SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
unset JDK_JAVA_OPTIONS
alias java='java "$SILENT_JAVA_OPTIONS"'
setopt HIST_IGNORE_ALL_DUPS

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source "$XDG_CACHE_HOME"/wal/colors.sh

lam -e crunch-mini
printf "\n"

