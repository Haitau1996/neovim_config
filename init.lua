require('packer').startup(function()
    use {'airblade/vim-gitgutter'}
    use {'dense-analysis/ale'}
	use {
	  "folke/which-key.nvim",
	  config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	  end
	}
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
