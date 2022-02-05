# No greeting when starting an interactive shell.
function fish_greeting
    lam -e crunch
    printf "\n"
end

export PATH="$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$HOME/.jdks/jdk-16.0.1/bin:$HOME/.local/bin:$PATH"
export VISUAL=nvim
export EDITOR=nvim
# export LD_PRELOAD=/usr/lib/libwcwidth-icons.so

alias l 'ls -lah'
alias ll 'ls -lh'
alias li "exa --long --all --group --icons"
alias cs exa
alias ca "exa --long --all --group"
alias lls logo-ls
alias lla "logo-ls -l --all"

alias mount-phone "go-mtpfs $HOME/Phone"
alias unmount-phone "fusermount -u $HOME/Phone"
alias mount-ssd "udisksctl mount -b /dev/nvme0n1p1"
alias unmount-ssd "udisksctl unmount -b /dev/nvme0n1p1"

alias logout "killall bspwm"
alias lock locklauncher
alias suspend "systemctl suspend; locklauncher"

alias pac "sudo pacman"
alias commit "git add . && git commit -m"
alias clone "git clone"
alias push "git push"
alias pull "git pull"
alias cls clear
alias nv nvim
alias la "ls -la"
alias fm ranger

alias coldarch "$XDG_CONFIG_HOME/neofetch/launch.bash --coldarch"
alias verycold "$XDG_CONFIG_HOME/neofetch/launch.bash --verycoldarch"
alias foodfetch "$XDG_CONFIG_HOME/neofetch/launch.bash --food"

alias floskull "$XDG_CONFIG_HOME/neofetch/launch.bash --flowerskull"
alias fspolar "$XDG_CONFIG_HOME/neofetch/launch.bash --flowerskull polar"
alias fswarm "$XDG_CONFIG_HOME/neofetch/launch.bash --flowerskull warm"
alias fsauro "$XDG_CONFIG_HOME/neofetch/launcher.bash --flowerskull aurorae"
alias fwaifu "$XDG_CONFIG_HOME/neofetch/launcher.bash --waifu"

alias coldfetch "neofetch --config $XDG_CONFIG_HOME/neofetch/coldfetch.conf"
alias coldasf "neofetch --config $XDG_CONFIG_HOME/neofetch/cold-as-fuck.conf"
alias foodfetch "neofetch --config $XDG_CONFIG_HOME/neofetch/foodfetch.conf"
alias skullfetch "neofetch --config $XDG_CONFIG_HOME/neofetch/skullfetch.conf"

alias fedit "nv $XDG_CONFIG_HOME/fish/config.fish"
alias zedit "nv $HOME/.zshrc"
alias bedit "nv $HOME/.bashrc"
alias p10kedit "nv $HOME/.p10k.zsh"
alias kev="xev -event keyboard"
alias visudo="nvim /etc/sudoers"
alias zshalias="nv $XDG_CONFIG_HOME/zsh/overlap.zsh"

alias fzf "fzf --prompt ' ' --pointer '->'"
alias ccbonsai="cbonsai -ilt 0.02 -c '  ,  ,  ,  ,  ' -L 80"
alias tty-clock="tty-clock -S -c -C4 -D -s -n"
alias yts="ytfzf -t"

alias pipes1 "lam -e pipes1"
alias pipes2 "lam -e pipes2"
alias pipes2-slim "lam -e pipes2-slim"
alias rain "lam -e rain"

alias yts "ytfzf -t"
alias ani720 "ani-cli -q 720"
alias ani480 "ani-cli -q 480"
alias pisend "$XDG_CONFIG_HOME/picom/launcher"
alias tintsend "$XDG_CONFIG_HOME/tint2/launcher"

alias java "$HOME/.jdks/jdk-16.0.1/bin/java"
alias javac "$HOME/.jdks/jdk-16.0.1/bin/javac"
alias jshell "$HOME/.jdks/jdk-16.0.1/bin/jshell"

alias pac "sudo pacman"
alias pacupg 'sudo pacman -Syu'
alias pacin 'sudo pacman -S'
alias pacins 'sudo pacman -U'
alias pacre 'sudo pacman -R'
alias pacrem 'sudo pacman -Rns'
alias pacrep 'pacman -Si'
alias pacreps 'pacman -Ss'
alias pacloc 'pacman -Qi'
alias paclocs 'pacman -Qs'
alias pacinsd 'sudo pacman -S --asdeps'
alias pacmir 'sudo pacman -Syy'
alias paclsorphans 'sudo pacman -Qdt'
alias pacrmorphans 'sudo pacman -Rs (pacman -Qtdq)'
alias pacfileupg 'sudo pacman -Fy'
alias pacfiles 'pacman -F'
alias pacls 'pacman -Ql'
alias pacown 'pacman -Qo'
alias pacupd "sudo pacman -Sy"
alias upgrade 'sudo pacman -Syu'

alias yaconf 'yay -Pg'
alias yaupg 'yay -Syu'
alias yasu 'yay -Syu --noconfirm'
alias yain 'yay -S'
alias yains 'yay -U'
alias yare 'yay -R'
alias yarem 'yay -Rns'
alias yarep 'yay -Si'
alias yareps 'yay -Ss'
alias yaloc 'yay -Qi'
alias yalocs 'yay -Qs'
alias yalst 'yay -Qe'
alias yaorph 'yay -Qtd'
alias yainsd 'yay -S --asdeps'
alias yamir 'yay -Syy'
alias yaupd "yay -Sy"
alias upgrade 'yay -Syu'

alias zip "unzip -l"
alias rar "unrar l"
alias tar "tar tf"
alias tar.gz "echo "
alias ace "unace l"

alias grepin 'grep -i'
alias grep 'grep --color'

alias rd rmdir
alias run-help man

alias startx 'startx -- -keeptty >~/.xorg.log 2>&1'
alias reconnect "nmcli d c wlp0s20f3"

alias _ sudo
alias afind 'ack -il'

function killew
    set EWWC_FRAGMENT "eww -c $XDG_CONFIG_HOME/eww/structures"
    eval "rm $XDG_CACHE_HOME/launch_main.eww &> /dev/null"
    eval "rm $XDG_CACHE_HOME/launch_wallpaper.eww &> /dev/null"
    eval "$EWWC_FRAGMENT/main-utils kill &>/dev/null"
    eval "$EWWC_FRAGMENT/wallpaper kill &>/dev/null"
    set EWWC_FRAGMENT ""
end

alias rofisc "wmctrl -s 2; rofi -show & sleep 1 && maim lol.png"
alias nvconfig "fm ~/.config/nvim/lua/"

alias tping "ping -c5 google.com"
alias iping "ping google.com"

alias yta-mp3 "youtube-dl --extract-audio --audio-format mp3"
alias ytv-best "youtube-dl -f bestvideo+bestaudio "
alias killconk "killall conky"

alias upgrub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias upfont 'sudo fc-cache -fv'

alias kittythemes "kitty +kitten themes"
alias nvupd="nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"

function nordbar
    killall polybar
    polybar -q -c "$XDG_CONFIG_HOME/polybar/configs/antartica/$1.ini" main & disown
end

# vim:ft=fish:nowrap
