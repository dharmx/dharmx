" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
    " Git wrapper
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-rhubarb'
 
    " Nerd Commenter
    Plug 'scrooloose/nerdcommenter'

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

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    
    " File Explorers
    Plug 'scrooloose/NERDTree' | Plug 'jistr/vim-nerdtree-tabs'
    " Plug 'kyazdani42/nvim-tree.lua'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Discord RPC
    Plug 'vimsence/vimsence'
    
    " HTML emmet shortcut completions
    Plug 'mattn/emmet-vim'

    " Vim start page
    Plug 'mhinz/vim-startify'

    " Plug 'kyazdani42/nvim-web-devicons'

    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

    Plug 'elkowar/yuck.vim'

    Plug 'bhurlow/vim-parinfer'

    " Multiple Cursors
    Plug 'terryma/vim-multiple-cursors'

    " Indent guides
    Plug 'Yggdroot/indentLine'

    " Add DevIcons
    Plug 'ryanoasis/vim-devicons'

    " Tagbar
    Plug 'liuchengxu/vista.vim'

    " NERDTree
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " Emoji support
    Plug 'junegunn/vim-emoji'

    " goyo distraction free mode
    Plug 'junegunn/goyo.vim'

    " Any valid git URL is allowed
    Plug 'https://github.com/junegunn/vim-github-dashboard.git'

    " LaTeX support
    Plug 'lervag/vimtex'

    " Wal theme
    Plug 'dylanaraps/wal.vim'
    Plug 'deviantfero/wpgtk.vim'

    " Markdown Preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

    " vim-hexcolor
    Plug 'etdev/vim-hexcolor'

    " codi interactive scratchpad
    " Temporary repo, may be deprecated
    Plug 'metakirby5/codi.vim'

    " Easy tables in vim
    Plug 'dhruvasagar/vim-table-mode'

    " VS-Code style minimap
    Plug 'wfxr/minimap.vim'

    " Easymodion
    Plug 'easymotion/vim-easymotion'

    " Plug the vim wiki
    Plug 'vimwiki/vimwiki'

call plug#end()

