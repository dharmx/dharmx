export PATH="$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$HOME/.jdks/jdk-16.0.1/bin:$HOME/.local/bin:$PATH"
export VISUAL=nvim;
export EDITOR=nvim;
# export LD_PRELOAD=/usr/lib/libwcwidth-icons.so

alias ls "exa"
alias la "exa --long --all --group"
alias lls="logo-ls"
alias lla="logo-ls -l --all"

alias mount-phone "go-mtpfs $HOME/Phone"
alias unmount-phone "fusermount -u $HOME/Phone"
alias mount-ssd "udisksctl mount -b /dev/nvme0n1p1"
alias unmount-ssd "udisksctl unmount -b /dev/nvme0n1p1"

alias logout "killall bspwm"
alias lock "betterlockscreen -l"
alias suspend "systemctl suspend"

alias pac "sudo pacman"
alias commit "git add . && git commit -m"
alias clone "git clone"
alias push="git push"
alias pull="git pull"
alias cls "clear"
alias nv "nvim"
alias fm "ranger"

alias nfk "neofetch --config $XDG_CONFIG_HOME/neofetch/main-config.conf --source ($XDG_CONFIG_HOME/neofetch/randomize.sh $XDG_CONFIG_HOME/neofetch/paths.txt) --backend kitty --xoffset 25 --yoffset 20 --gap 40"
alias nf "neofetch --config $XDG_CONFIG_HOME/neofetch/main-config.conf --source ($XDG_CONFIG_HOME/neofetch/randomize.sh $XDG_CONFIG_HOME/neofetch/paths.txt) --backend w3m"
alias pf "neofetch --config $XDG_CONFIG_HOME/neofetch/config-minimal.conf --ascii $XDG_CONFIG_HOME/neofetch/arch-smol"
alias uwuf "neofetch --config $XDG_CONFIG_HOME/neofetch/config-minimal-uwu.conf --ascii $XDG_CONFIG_HOME/neofetch/uwu-hd"

alias pipes1 "pipes1"
alias pipes2 "pipes2"
alias pipes2-slim "pipes2-slim"
alias rain "rain"

printf "\n"

