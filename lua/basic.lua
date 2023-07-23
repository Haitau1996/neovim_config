-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 启用 powerline
vim.g.airline_powerline_fonts = 1
-- 启用鼠标支持
vim.o.mouse = 'a'
-- 设置 tab 大小
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt_local.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
-- Set search option
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.cmd(
   [[inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"]]
)
