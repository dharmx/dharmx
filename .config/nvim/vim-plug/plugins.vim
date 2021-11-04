" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

    " Make sure you use single quotes

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " Any valid git URL is allowed
    Plug 'https://github.com/junegunn/vim-github-dashboard.git'

    " Multiple Plug commands can be written in a single line using | separators
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " Using a non-default branch
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

    " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
    Plug 'fatih/vim-go', { 'tag': '*' }

    " Plugin options
    Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

    " Plugin outside ~/.vim/plugged with post-update hook
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " Unmanaged plugin (manually installed and updated)
    Plug '~/my-prototype-plugin'

    " Initialize plugin system
    
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    
    " File Explorers
    Plug 'scrooloose/NERDTree' | Plug 'jistr/vim-nerdtree-tabs'
    " Plug 'kyazdani42/nvim-tree.lua'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Nord coloscheme
    Plug 'arcticicestudio/nord-vim'

    " Discord RPC
    Plug 'vimsence/vimsence'
    
    " HTML emmet shortcut completions
    Plug 'mattn/emmet-vim'

    " Vim start page
    Plug 'mhinz/vim-startify'

    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'dracula/vim', { 'as': 'dracula' }

    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

    Plug 'elkowar/yuck.vim'

    Plug 'bhurlow/vim-parinfer'

call plug#end()

