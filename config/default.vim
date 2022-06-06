"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"   Basic settings for enconding 
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    set encoding=utf-8
    set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
    set langmenu=zh_CN.UTF-8
    set termencoding=utf-8
    let $my_vimdir = $localappdata.'\nvim'

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"  basic setting for indent tab and etc. "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    syntax enable
    syntax on
    filetype plugin indent on
    set autoindent
    set backspace=indent,eol,start  " make backspaces more powerfull
    set expandtab  
    set expandtab  "expand tabs to space essential in python"
    set mouse=a
    set nocompatible
    set nu
    set relativenumber
    set ruler 
    set shiftwidth=4
    set showcmd                     " show (partial) command in status line
    set softtabstop=4 
    set ts=4  

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"  Enable vim-powerline"
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    let g:airline_powerline_fonts = 1 

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"   设置 swap 文件的位置
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    set dir=$my_vimdir\swap

" enable auto format
        nnoremap <F6> :Autoformat<CR>
        let g:autoformat_autoindent = 0
        let g:autoformat_retab = 0
        let g:autoformat_remove_trailing_spaces = 0
" special setting for python
        let python_highlight_all=1
        au Filetype python set textwidth=90
        au Filetype python set fileformat=unix
        autocmd Filetype python set foldmethod=indent
        autocmd Filetype python set foldlevel=99

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"   彩虹括号 BETTER RAINBOW PARENTHESES
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 1

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"   设置 RAINBOW PARENTHESES IMPROVED
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"   设置 C++ 代码的高亮
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    " Disable function highlighting (affects both C and C++ files)
    let g:cpp_function_highlight = 0
    " Enable highlighting of C++11 attributes
    let g:cpp_attributes_highlight = 1
    " Highlight struct/class member variables (affects both C and C++ files)
    let g:cpp_member_highlight = 1
    " Put all standard C and C++ keywords under Vim's highlight group 'Statement'
    " (affects both C and C++ files)
    let g:cpp_simple_highlight = 1

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"   设置 按 F5 自动编译
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!clang % -o %<.exe"
                exec "!\%<.exe"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<.exe"
                exec "!\%<.exe"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!java %<"
        elseif &filetype == 'rust'
                exec "!rustc % -o %<.exe"
                exec "!\%<.exe"
        endif
endfunc

" 改变esc的键盘映射
    inoremap <C-[> <ESC>
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"   modern  C++ SYNTAX HIGHLIGHTING
"   syntax highlighting for modern C++
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
" Function highlighting (affects both C and C++ files)
    let g:cpp_function_highlight = 1
" Enable highlighting of C++11 attributes
    let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
    let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
    let g:cpp_simple_highlight = 1


    let g:todo_highlight_config = {
          \ 'todo': {},
          \   'NOTE': {
          \     'gui_fg_color': '#ffffff',
          \     'gui_bg_color': '#ffbd2a',
          \     'cterm_fg_color': 'white',
          \     'cterm_bg_color': '214'
          \   }
          \ }
