local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    {"folke/which-key.nvim"},
    {"folke/neoconf.nvim", cmd = "Neoconf"},
    {"folke/neodev.nvim"},
    {'airblade/vim-gitgutter'},
    {'fatih/vim-go'},
    {'junegunn/fzf'},
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
    {'junegunn/fzf.vim'},
    {'mechatroner/rainbow_csv'},
    {'neoclide/coc.nvim', branch = 'release'},
    {'neovim/nvim-lspconfig'},
    {'nvim-treesitter/nvim-treesitter'},
    {'scrooloose/nerdtree'},
    {'tpope/vim-commentary'},
    {'tpope/vim-fugitive'},
    {'tpope/vim-rails'},
    {'tpope/vim-surround'},
    {'vim-airline/vim-airline'},
    {'vim-airline/vim-airline-themes'},
    {'wbthomason/packer.nvim'},
})
require('basic')
