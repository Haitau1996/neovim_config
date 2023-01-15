source ~/.config/nvim/config/default.vim

call plug#begin('~/.vim/plugged')

    Plug 'Chiel92/vim-autoformat'
    Plug 'bfrg/vim-cpp-modern'
    Plug 'dense-analysis/ale'
    Plug 'easymotion/vim-easymotion'
    Plug 'ervandew/supertab'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'
    Plug 'kien/ctrlp.vim'
    Plug 'luochen1990/rainbow'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'rust-lang/rust.vim'
    Plug 'sakshamgupta05/vim-todo-highlight'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'skywind3000/quickmenu.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-jp/vim-cpp'
    Plug 'yggdroot/indentline'

    if has('nvim')
      function! UpdateRemotePlugins(...)
        " Needed to refresh runtime files
        let &rtp=&rtp
        UpdateRemotePlugins
      endfunction

      Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
    else
      Plug 'gelguy/wilder.nvim'

      " To use Python remote plugin features in Vim, can be skipped
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif

call plug#end()
