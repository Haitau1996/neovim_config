let $my_vimdir = $localappdata.'\nvim'
source $my_vimdir\config\default.vim
source $my_vimdir\config\ycm.vim

call plug#begin('$my_vimdir/plugged')

    Plug 'Chiel92/vim-autoformat'
    Plug 'bfrg/vim-cpp-modern'
    Plug 'easymotion/vim-easymotion'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'github/copilot.vim' 
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'
    Plug 'kien/ctrlp.vim'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'luochen1990/rainbow'
    Plug 'rust-lang/rust.vim'
    Plug 'sakshamgupta05/vim-todo-highlight'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'skywind3000/quickmenu.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-jp/vim-cpp'
    Plug 'ycm-core/YouCompleteMe'

call plug#end()
