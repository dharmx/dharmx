# export LD_PRELOAD=/usr/lib/libwcwidth-icons.so
export VISUAL=nvim;
export EDITOR=nvim;
export PATH="/home/maker/.local/share/gem/ruby/3.0.0/bin:/home/maker/.jdks/jdk-16.0.1/bin:/home/maker/.bin:/home/maker/.local/bin:$PATH"

alias ls "exa"
alias la "exa --long --all --group"
alias lls="logo-ls"
alias lla="logo-ls -l --all"

alias mount-phone "go-mtpfs ~/phone"
alias umount-phone "fusermount -u ~/phone"
alias mount-ssd="udisksctl mount -b /dev/nvme0n1p1"
alias unmount-ssd="udisksctl unmount -b /dev/nvme0n1p1"

alias logout "killall bspwm"
alias lock "betterlockscreen -l dim --off 5"
alias suspend "systemctl suspend"

alias pac "sudo pacman"
# alias vi "vim"
alias nv "nvim"
alias fm "ranger"

alias nf "neofetch --source (~/.config/neofetch/randomize.sh ~/.config/neofetch/paths.txt) --backend w3m --loop"
# alias nfk "neofetch --source (~/.config/neofetch/randomize.sh ~/.config/neofetch/paths.txt) --backend kitty"
alias pf "neofetch --config /home/maker/.config/neofetch/config-minimal.conf --ascii ~/.config/neofetch/arch-smol"
alias uwuf "neofetch --config /home/maker/.config/neofetch/config-minimal-uwu.conf --ascii ~/.config/neofetch/uwu-hd"

alias pipes1 "/home/maker/Dotfiles/lambda-scripts/aesthetic/pipes1"
alias pipes2 "/home/maker/Dotfiles/lambda-scripts/aesthetic/pipes2"
alias pipes2-slim "/home/maker/Dotfiles/lambda-scripts/aesthetic/pipes2-slim"
alias rain "/home/maker/Dotfiles/lambda-scripts/aesthetic/rain"

clear
colorscript exec alpha
printf "\n"

