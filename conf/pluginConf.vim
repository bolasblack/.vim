"------------ 一般插件配置 ---------------
" Taglist 配置 {{{
"TlistUpdate可以更新tags
"map <F3> :silent! Tlist<CR> "按下F3就可以呼出了
"let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
"let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
"let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
"let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
"let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
"let Tlist_Process_File_Always=0 "不是一直实时更新tags，因为没有必要
"let Tlist_Inc_Winwidth=0
" 这项必须设定，否则出错,配置taglist的ctags路径，不过也可以把ctags路径添
" 加进系统变量 path 里，就不用设置了
"let Tlist_Ctags_Cmd = '~/ctags.exe'
" 设置tags文件的寻找路径
"set tags += tags;
" }}}

" Tagbar 配置
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

" TxtBrowser 设置 {{{
au BufEnter *.txt setlocal ft=txt
" let g:default_web_browser=chrome
" }}}

" Zen Coding 配置 {{{
let g:user_zen_settings = { 
  \  'indentation' : '  ', 
  \  'perl' : { 
  \    'aliases' : { 
  \      'req' : 'require ' 
  \    }, 
  \    'snippets' : { 
  \      'use' : "use strict\nuse warnings\n\n", 
  \      'warn' : "warn \"|\";", 
  \    } 
  \  } 
  \} 
  let g:user_zen_expandabbr_key = '<c-y>'    "设置为ctrl+y展开
  let g:use_zen_complete_tag = 1
" }}}

" Netrw 设置 {{{
let g:netrw_winsize = 30
"输入',fe'时，就会打开一个垂直分隔的窗口浏览当前文件所在的目录，窗口的宽度为30
nmap <silent> <leader>ntf :Sexplore!<cr> 
"}}}

" NeoComplcache 设置 "{{{
" Use neocomplcache. 
let g:neocomplcache_enable_at_startup = 1
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 0 
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 0 
" Use underbar completion. 
let g:neocomplcache_enable_underbar_completion = 0 
" Set minimum syntax keyword length. 
let g:neocomplcache_min_syntax_length = 3 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' 

"Define dictionary. 
let g:neocomplcache_dictionary_filetype_lists = { 
	\ 'default' : '', 
	\ 'vimshell' : $HOME.'/.vimshell_hist', 
	\ 'scheme' : $HOME.'/.gosh_completions' 
	\ } 

" Define keyword. 
if !exists('g:neocomplcache_keyword_patterns') 
	let g:neocomplcache_keyword_patterns = {} 
endif 
let g:neocomplcache_keyword_patterns['default'] = '\h\w*' 

" Plugin key-mappings. 
imap <C-k>     <Plug>(neocomplcache_snippets_expand) 
smap <C-k>     <Plug>(neocomplcache_snippets_expand) 
inoremap <expr><C-g>     neocomplcache#undo_completion() 
inoremap <expr><C-l>     neocomplcache#complete_common_string() 

" SuperTab like snippets behavior. 
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>" 

" Recommended key-mappings. 
" <CR>: close popup and save indent. 
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" 
" <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
" <C-h>, <BS>: close popup and delete backword char. 
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><C-d>  neocomplcache#close_popup() 
inoremap <expr><C-e>  neocomplcache#cancel_popup() 

" AutoComplPop like behavior. 
"let g:neocomplcache_enable_auto_select = 1 

" Shell like behavior(not recommended). 
"set completeopt+=longest 
"let g:neocomplcache_enable_auto_select = 1 
"let g:neocomplcache_disable_auto_complete = 1 
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>" 
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" 

" Enable omni completion. 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 

" Enable heavy omni completion. 
if !exists('g:neocomplcache_omni_patterns') 
let g:neocomplcache_omni_patterns = {} 
endif 
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete 
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"}}}
