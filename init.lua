require('packer').startup(function()
    use {'airblade/vim-gitgutter'}
    use {'dense-analysis/ale'}
    use {'fatih/vim-go'}
    use {'junegunn/fzf'}
    use {'junegunn/fzf.vim'}
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'neovim/nvim-lspconfig'}
    use {'nvim-treesitter/nvim-treesitter'}
    use {'scrooloose/nerdtree'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'}
    use {'vim-airline/vim-airline'}
    use {'vim-airline/vim-airline-themes'}
    use {'wbthomason/packer.nvim'}
    use {'yianwillis/vimcdoc'}
end)

require('basic')
