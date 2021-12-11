# No greeting when starting an interactive shell.
function fish_greeting
  lam -e crunch
  printf "\n"
end

export PATH="$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$HOME/.jdks/jdk-16.0.1/bin:$HOME/.local/bin:$PATH"
export VISUAL=nvim;
export EDITOR=nvim;
# export LD_PRELOAD=/usr/lib/libwcwidth-icons.so
    
# 'l' shows the contents + hidden ones including a header
# 'll' just shows the contents including a header
alias li "exa --long --all --group --icons"
alias cs "exa"
alias ca "exa --long --all --group"
alias lls "logo-ls"
alias lla "logo-ls -l --all"

alias mount-phone "go-mtpfs $HOME/Phone"
alias unmount-phone "fusermount -u $HOME/Phone"
alias mount-ssd "udisksctl mount -b /dev/nvme0n1p1"
alias unmount-ssd "udisksctl unmount -b /dev/nvme0n1p1"

alias logout "killall bspwm"
alias lock "betterlockscreen -l"
alias suspend "systemctl suspend; locklauncher"

alias pac "sudo pacman"
alias commit "git add . && git commit -m"
alias clone "git clone"
alias push "git push"
alias pull "git pull"
alias cls "clear"
alias nv "nvim"
alias la "ls -la"
alias fm "ranger"

alias coldarch "$XDG_CONFIG_HOME/neofetch/launcher --coldarch"
alias verycold "$XDG_CONFIG_HOME/neofetch/launcher --verycoldarch"
alias foodfetch "$XDG_CONFIG_HOME/neofetch/launcher --food"

alias floskull "$XDG_CONFIG_HOME/neofetch/launcher --flowerskull"
alias fspolar "$XDG_CONFIG_HOME/neofetch/launcher --flowerskull polar"
alias fswarm "$XDG_CONFIG_HOME/neofetch/launcher --flowerskull warm"
alias fsauro "$XDG_CONFIG_HOME/neofetch/launcher --flowerskull aurorae"
alias fwaifu "$XDG_CONFIG_HOME/neofetch/launcher --waifu"

alias coldfetch="neofetch --config $XDG_CONFIG_HOME/neofetch/coldfetch.conf"
alias coldasf="neofetch --config $XDG_CONFIG_HOME/neofetch/cold-as-fuck.conf"
alias foodfetch="neofetch --config $XDG_CONFIG_HOME/neofetch/foodfetch.conf"
alias skullfetch="neofetch --config $XDG_CONFIG_HOME/neofetch/skullfetch.conf"

alias fedit "nv $XDG_CONFIG_HOME/fish/config.fish"
alias zedit "nv $HOME/.zshrc"
alias bedit "nv $HOME/.bashrc"
alias p10kedit "nv $HOME/.p10k.zsh"
alias kev="xev -event keyboard"

alias fzf "fzf --prompt ' ' --pointer '->'"
alias ccbonsai="cbonsai -ilt 0.02 -c '  ,  ,  ,  ,  ' -L 80"
alias tty-clock="tty-clock -S -c -C4 -D -s -n"
alias yts="ytfzf -t"

alias pipes1 "lam -e pipes1"
alias pipes2 "lam -e pipes2"
alias pipes2-slim "lam -e pipes2-slim"
alias rain "lam -e rain"

alias java="$HOME/.jdks/jdk-16.0.1/bin/java"
alias javac="$HOME/.jdks/jdk-16.0.1/bin/javac"
alias jshell="$HOME/.jdks/jdk-16.0.1/bin/jshell"

