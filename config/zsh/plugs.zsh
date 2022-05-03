ZPLUG_CACHE_DIR="$XDG_CACHE_HOME/zsh/zplug"
ZPLUG_REPOS="$XDG_DATA_HOME/zsh/zplug"
ZPLUG_HOME="$ZDOTDIR/zplug"
ZPLUG_BIN="$ZDOTDIR/bin"
ZPLUG_THREADS=10

if [ ! -d "$ZPLUG_HOME" ]; then
    echo "ZPLUG not found. Cloning..."
    git clone --depth 1 https://github.com/zplug/zplug "$ZPLUG_HOME"
fi

source "$ZPLUG_HOME/init.zsh"
alias use="zplug"

use "zsh-users/zsh-history-substring-search", "depth:1"

use "zsh-users/zsh-syntax-highlighting", "depth:1"

use "marlonrichert/zsh-autocomplete", "depth:1"

use "hlissner/zsh-autopair", "depth:1"

use "zsh-users/zsh-autosuggestions", "depth:1"

use "junegunn/fzf-bin", "from:gh-r", "as:command", "rename-to:fzf"

use "romkatv/gitstatus", "depth:1"

use "MichaelAquilina/zsh-you-should-use", "depth:1"

use "romkatv/powerlevel10k", "as:theme", "depth:1"

unalias use

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# vim:ft=zsh
