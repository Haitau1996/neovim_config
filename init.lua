require('packer').startup(function()
    use {'tpope/vim-fugitive'}
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'wbthomason/packer.nvim'}
end)

require('basic')
