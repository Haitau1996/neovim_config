require('packer').startup(function()
    use {'airblade/vim-gitgutter'}
    use {'dense-analysis/ale'}
    use {'junegunn/fzf'}
    use {'junegunn/fzf.vim'}
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'scrooloose/nerdtree'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'}
    use {'vim-airline/vim-airline'}
    use {'vim-airline/vim-airline-themes'}
    use {'wbthomason/packer.nvim'}
    use {'ray-x/go.nvim'}
    use {'ray-x/guihua.lua'} -- recommended if need floating window support
    use {'neovim/nvim-lspconfig'}
    use {'nvim-treesitter/nvim-treesitter'}
end)

require('basic')
