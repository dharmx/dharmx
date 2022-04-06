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

zplug "zsh-users/zsh-history-substring-search", "depth:1"

zplug "zdharma-continuum/fast-syntax-highlighting", "depth:1"

zplug "marlonrichert/zsh-autocomplete", "depth:1"

zplug "hlissner/zsh-autopair", "depth:1"

zplug "zsh-users/zsh-autosuggestions", "depth:1"

zplug "junegunn/fzf-bin", "from:gh-r", "as:command", "rename-to:fzf"

zplug "romkatv/gitstatus", "depth:1"

zplug "MichaelAquilina/zsh-you-should-use", "depth:1"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# vim:ft=zsh
