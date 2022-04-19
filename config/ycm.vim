" Enable debugging
let $my_vimdir = $localappdata.'\nvim'
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'error'
let g:ycm_global_ycm_extra_conf='$my_vimdir\config\.ycm_extra_conf.py'
let g:ycm_use_clangd = 0


let &rtp .= ',' . expand( '<sfile>:p:h' )

let g:ycm_confirm_extra_conf=0
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释和字符串中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

"  开始补全的字符数和候选个数
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_max_num_candidates = 30
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1

"  error 和 warmming 符号
let g:ycm_error_symbol = '>!'
let g:ycm_warning_symbol = '>>'
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0

" List 选择的快捷键
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'
