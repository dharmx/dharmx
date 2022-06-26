ZINIT_HOME="$XDG_DATA_HOME/zsh/zinit"
if [ ! -d "$ZINIT_HOME" ]
then
    echo "ZINIT not found. Cloning..."
    git clone --depth 1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"
alias use='zinit light'
alias snip='zinit snippet'
alias ice='zinit ice'
alias load='zinit load'

ice depth"1"
use zsh-users/zsh-completions

autoload compinit
compinit

use romkatv/powerlevel10k 
use marlonrichert/zsh-autocomplete 
use hlissner/zsh-autopair 
use zdharma-continuum/fast-syntax-highlighting
use MichaelAquilina/zsh-you-should-use 
use zsh-users/zsh-autosuggestions

ice wait'3' lucid
load zsh-users/zsh-history-substring-search 

ice wait'2' lucid
load zdharma-continuum/history-search-multi-word

# ice wait'5' lucid
# snip https://gist.githubusercontent.com/hightemp/5071909/raw/
unalias use snip ice load

# vim:ft=zsh
