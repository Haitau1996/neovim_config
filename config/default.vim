"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"   Basic settings for enconding 
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    set encoding=utf-8
    set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
    set langmenu=zh_CN.UTF-8
    set termencoding=utf-8

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"  basic setting for indent tab and etc. "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    set autoindent
    set backspace=indent,eol,start  " make backspaces more powerfull
    set mouse=a
    set nocompatible
    set number relativenumber  " Hybrid line number on
    set ruler 
    set shiftwidth=4
    set showcmd                     " show (partial) command in status line
    set softtabstop=4 
    set tabstop=4  
    set expandtab  
    syntax enable
    syntax on
    filetype plugin indent on

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"  Enable vim-powerline"
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    let g:airline_powerline_fonts = 1 

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"   设置 swap 文件的位置
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    set dir=/home/chenht/.config/nvim/swap

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
    let g:cpp_function_highlight = 1
    " Enable highlighting of C++11 attributes
    let g:cpp_attributes_highlight = 1
    " Highlight struct/class member variables (affects both C and C++ files)
    let g:cpp_member_highlight = 1
    " Put all standard C and C++ keywords under Vim's highlight group 'Statement'
    " (affects both C and C++ files)
    let g:cpp_simple_highlight = 1

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"   设置 按 F5 自动编译 && 启动调试
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!clang % -o %<"
                exec "!./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!java %<"
        elseif &filetype == 'rust'
                exec "!rustc % -o %<"
                exec "!./%<"
        endif
endfunc


map <F7> :call CompileDebugGcc()<CR>
func! CompileDebugGcc()
        exec "w"
        if &filetype == 'c'
                exec "!clang % -o %<"
                exec "!gdb %<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!gdb %<"
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

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"  vim todo highlight config
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    let g:todo_highlight_config = {
		\ 'todo': {
		\  },
		\   'NOTE': {
		\     'gui_fg_color': '#ffffff',
		\     'gui_bg_color': '#ffbd2a',
		\     'cterm_fg_color': 'white',
		\     'cterm_bg_color': '214'
		\   }
		\ }

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"  basic setting for indent line plugin
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    let g:indentLine_char_list = ['|', '¦', '┆', '┊','⎸']

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"  ale config
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	let g:ale_sign_error = '✗'
	let g:ale_sign_warning = '⚡'
	let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
	let g:ale_linters = {
	\   'cpp': ['clang','cppcheck','clang-check'],
	\   'c': ['clang'],
	\   'python': ['pylint'],
	\}
    let g:ale_c_cc_options = '-Wall -Werror -Wextra -std=c11'
    let g:ale_cpp_cc_options = '-Wall -Werror -Wextra -std=c++17'
    let g:ale_cpp_clangcheck_executable = 'clang-check'
    let g:ale_cpp_cppcheck_executable = 'cppcheck'
    "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
	nmap sp <Plug>(ale_previous_wrap)
	nmap sn <Plug>(ale_next_wrap)
	"<Leader>s触发/关闭语法检查
	nmap <Leader>s :ALEToggle<CR>
	"<Leader>d查看错误或警告的详细信息
	nmap <Leader>d :ALEDetail<CR>
    let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
