ZNAP_PLUGIN_DIR="$XDG_DATA_HOME/zsh/plugins/zsh-snap"
if [ ! -f "$ZNAP_PLUGIN_DIR/znap.zsh" ]
then
    echo "ZNAP not found. Cloning..."
    git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git "$ZNAP_PLUGIN_DIR"
fi

source "$ZNAP_PLUGIN_DIR/znap.zsh"
zstyle ':znap:*:*' git-maintenance on
zstyle ':znap:*' auto-compile yes

znap prompt romkatv/powerlevel10k

znap source zsh-users/zsh-history-substring-search
znap source zsh-users/zsh-syntax-highlighting
znap source marlonrichert/zsh-autocomplete
znap source hlissner/zsh-autopair
znap source zsh-users/zsh-autosuggestions
znap source MichaelAquilina/zsh-you-should-use

# vim:ft=zsh
