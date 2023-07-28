alias xclip='xclip -selection clipboard'

if [ $(command -v exa) ]; then
  alias li="exa --long --all --group --icons"
  alias ls="exa"
  alias la="exa --long --all --group"
  alias tree="exa --color=always --icons --tree"
fi

if [ $(command -v nvim) ]; then
  alias nv="nvim"
  alias nvcfg="nv ~/.config/nvim/"
  alias nvst="nvim --startuptime $HOME/Documents/nvim-startuptime-'$(date)' +quitall"
fi

if [ $(command -v ranger) ]; then
  alias fm="ranger"
fi

alias pd=popd
alias tx=tmux
alias cls=clear
alias la="ls -la"

alias zedit="$EDITOR $HOME/.config/zsh/.zshrc"
alias bedit="$EDITOR $HOME/.bashrc"
alias fedit="$EDITOR $HOME/.config/fish/config.fish"

alias fzi="$HOME/.fzfimg.sh"
alias fzz='nvim $(fd --type=file . | fzf --preview "bat --theme=base16 --color=always --paging=never --number --italic-text=never --tabs=2 --wrap=never {}")'
alias fff='fc-list : family | awk -F"," "{print $1}" | sort | uniq | fzf | tr -d "\n" | xclip'

alias yts="ytfzf -t"
alias stx='startx -- -keeptty >~/.xorg.log 2>&1'

alias cd..='cd ../'
alias cd....='cd ../../'
alias cd......='cd ../../../'
alias cd........='cd ../../../../'
alias cd..........='cd ../../../../../'
alias ~='cd ~'
alias ..='cd ../'
alias ....='cd ../../'
alias ......='cd ../../../'
alias ........='cd ../../../../'
alias ..........='cd ../../../../../'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias _='sudo'

if [ $(command -v /usr/bin/zoxide) ]; then
  alias z..='z ../'
  alias z....='z ../../'
  alias z......='z ../../../'
  alias z........='z ../../../../'
  alias z..........='z ../../../../../'
fi

alias pac="sudo pacman"
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacins='sudo pacman -U'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacinsd='sudo pacman -S --asdeps'
alias pacmir='sudo pacman -Syy'
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias pacfileupg='sudo pacman -Fy'
alias pacfiles='pacman -F'
alias pacls='pacman -Ql'
alias pacown='pacman -Qo'
alias pacupd="sudo pacman -Sy"
alias upgrade='sudo pacman -Syu'

alias parconf='paru -Pg'
alias parupg='paru -Syu'
alias pars='paru -Syu --noconfirm'
alias parin='paru -S'
alias parins='paru -U'
alias pare='paru -R'
alias parem='paru -Rns'
alias parep='paru -Si'
alias pareps='paru -Ss'
alias parloc='paru -Qi'
alias parlocs='paru -Qs'
alias parlst='paru -Qe'
alias parorph='paru -Qtd'
alias parinsd='paru -S --asdeps'
alias parmir='paru -Syy'
alias parupd="paru -Sy"

alias g=git
alias ga='git add'
alias gaa='git add --all'
alias gam='git am'
alias gama='git am --abort'
alias gamc='git am --continue'
alias gams='git am --skip'
alias gamscp='git am --show-current-patch'
alias gap='git apply'
alias gapa='git add --patch'
alias gapt='git apply --3way'
alias gau='git add --update'
alias gav='git add --verbose'
alias gb='git branch'
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -d 2>/dev/null'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gc='git commit -v'
alias 'gc!'='git commit -v --amend'
alias gca='git commit -v -a'
alias 'gca!'='git commit -v -a --amend'
alias gcam='git commit -a -m'
alias 'gcan!'='git commit -v -a --no-edit --amend'
alias 'gcans!'='git commit -v -a -s --no-edit --amend'
alias gcas='git commit -a -s'
alias gcasm='git commit -a -s -m'
alias gcb='git checkout -b'
alias gcd='git checkout $(git_develop_branch)'
alias gcf='git config --list'
alias gclr='git clone --recurse-submodules'
alias gcl='git clone'
alias gcld='git clone --depth'
alias gclean='git clean -id'
alias gcm='git checkout $(git_main_branch)'
alias gcmsg='git commit -S -m'
alias 'gcn!'='git commit -v --no-edit --amend'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gcsm='git commit -s -m'
alias gcss='git commit -S -s'
alias gcssm='git commit -S -s -m'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdup='git diff @{upstream}'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune --jobs=10'
alias gfg='git ls-files | grep'
alias gfo='git fetch origin'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpur=ggu
alias ggpush='git push origin "$(git_current_branch)"'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias ghh='git help'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
alias gk='\gitk --all --branches &!'
alias gke='\gitk --all $(git log -g --pretty=%h) &!'
alias gl='git pull'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias globurl='noglob urlglobber '
alias glod='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'
alias glods='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'' --date=short'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --all'
alias glols='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --stat'
alias glp=_git_log_prettily
alias glum='git pull upstream $(git_main_branch)'
alias gm='git merge'
alias gma='git merge --abort'
alias gmom='git merge origin/$(git_main_branch)'
alias gmtl='git mergetool --no-prompt'
alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/$(git_main_branch)'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias 'gpf!'='git push --force'
alias gpoat='git push origin --all && git push origin --tags'
alias gpr='git pull --rebase'
alias gpristine='git reset --hard && git clean -dffx'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git push upstream'
alias gpv='git push -v'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grwh='git rm --cached `git ls-files -i -c --exclude-from=.gitignore`'
alias grwhx='git ls-files -i -c --exclude-from=.gitignore | xargs git rm --cached'
alias grad='git rm -r --cached . && git add .'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase $(git_develop_branch)'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'
alias grbo='git rebase --onto'
alias grbom='git rebase origin/$(git_main_branch)'
alias grbs='git rebase --skip'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias grev='git revert'
alias grh='git reset'
alias grhh='git reset --hard'
alias grm='git rm'
alias grmc='git rm --cached'
alias grmv='git remote rename'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grrm='git remote remove'
alias grs='git restore'
alias grset='git remote set-url'
alias grss='git restore --source'
alias grst='git restore --staged'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstall='git stash --all'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gstu='gsta --include-untracked'
alias gsu='git submodule update'
alias gsw='git switch'
alias gswc='git switch -c'
alias gswd='git switch $(git_develop_branch)'
alias gswm='git switch $(git_main_branch)'
alias gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
alias gupv='git pull --rebase -v'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'

alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias grep='grep --color'
alias grepin='grep -i'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | bat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias ff='/usr/bin/find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sorter='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias -s pdf=zathura
alias -s ps=gv
alias -s dvi=xdvi
alias -s chm=xchm
alias -s djvu=djview

alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s ace="unace l"

alias visudo="nvim /etc/sudoers"

alias reconnect="nmcli d c wlp0s20f3"
alias _ping="ping -c5 google.com"

alias yta-mp3="youtube-dl --extract-audio --audio-format mp3"
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

alias upgrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias upfnt='fc-cache -frv'

SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
alias java='java "$SILENT_JAVA_OPTIONS"'
unset JDK_JAVA_OPTIONS

alias nhist="dbus-monitor \"interface='org.freedesktop.Notifications'\" | grep --line-buffered \"member=Notify\|string\""
alias resrc="source $ZDOTDIR/.zshrc"

if [ $(command -v xsettingsd) ]; then
  alias reload-settings="pkill -HUP xsettingsd"
fi

if [ $(command -v font-config-info) ]; then
  alias fontcfg="font-config-info"
fi

alias wttr='curl wttr.in'
alias c='cd $(fd --type d . | fzf --preview "exa --long --icons --color=always {}")'
alias .c='cd $(fd --type d --hidden . | fzf --preview "exa --long --icons --color=always {}")'

alias l1='exa -1'
alias hdmitv="echo 'Xft.dpi:200\nst.font:Iosevka Nerd Font:pixelsize=38\nXcursor.size:32\n' | xrdb -merge"

alias rec='ffmpeg -f x11grab -framerate 60 -i $DISPLAY -pix_fmt yuv420p vid.mp4'
alias high_res='ffmpeg -framerate 60 -f x11grab -i $DISPLAY -c:v libx264rgb -crf 0 -preset ultrafast -color_range 2 vid.mp4'

alias ytdn='yt-dlp --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 320K --output "%(title)s.%(ext)s" --yes-playlist'
alias pacmanallkeys='sudo pacman-key --refresh-keys'
alias xwm='echo DISPLAY=:1; Xephyr -br -ac -noreset -screen 1600x900 :1'

if [ $(command -v task) ]; then
  alias apt-add="task add project:'Quantitative Aptitude' recur:1w due:mon,wed,fri"
  alias tbl-add="task add project:'Memorize Tables' add recur:1w due:tue,thu,sat"
  alias gi-add="task add project:'Logical Aptitude' add recur:1w due:tue,thu,sat"
  alias blog-add="task add project:'Blog Articles' add recur:1w due:sun"
  alias gk-add="task add project:'GK and Awareness' add recur:daily due:eod"
fi
