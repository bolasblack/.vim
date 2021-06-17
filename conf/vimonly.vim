" ----------- base setting [[[
" 高亮语法
syntax on
behave mswin
filetype plugin indent on
" 设置主题
colorscheme chaos

"set runtimepath+=~/.vim/vimcdoc/trunk/

set guioptions=       " 简洁界面
set showcmd           " 在窗口右下角显示完整命令已输入部分
set cursorline        " 高亮光标所在行
set number            " 显示行号
set visualbell        " 不要 beep 也不要闪屏
set laststatus=2      " Always show the statusline
set autoread          " 正在编辑的文件在外部被修改后自动读取
set noautochdir       " 不自动载入当前编辑文件的目录

" 以特定标记作为折叠规则
let g:foldIsMarker=1
set foldmethod=marker
set foldmarker=[[[,]]]                 " 用 [[[ ]]] 替代 {{{ }}}

" 缩进提示
" [Show invisibles](http://vimcasts.org/episodes/show-invisibles/)
" [语虚](http://yyq123.blogspot.tw/2011/11/vim-listchars.html)
set list
set listchars=tab:>>,trail:-

" 自定义光标形态，不闪烁
set gcr=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor-blinkon0,o:hor50-Cursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon0,r-cr:hor20-Cursor/lCursor-blinkon0,sm:block-Cursor-blinkon0

if &term =~ 'screen'
  set t_Co=256
endif

" 字体设置 [[[
if g:isWindows
    set guifont=Courier:h12:cANSI
    set guifontwide=NSimSun:h12 " guifontwide只有在encoding=utf-8时才生效
elseif g:isMac
    set guifont=Monaco:h11
    set guifontwide=YaHei\ Consolas\ Hybrid:h11
else
    set guifont=YaHei\ Consolas\ Hybrid\ 9 " 设置雅黑字体
endif
" ]]]

" 启动时默认大小 [[[
" 不论什么方法启动都是这个尺寸
"set lines=44 columns=84

" GUI 启动方式尺寸
"au GUIEnter * set lines=44 columns=84

" 分启动方式设定尺寸
if has('gui_running')
   set columns=82
else
  " This is console Vim.
  if exists('+lines')
"    set lines=140
  endif
  if exists('+columns')
"    set columns=82
  endif
endif
" ]]]

" [[[ Mac 的一些配置
let g:defaultGuiOptions = ''
if g:isMac
  let g:defaultGuiOptions = g:defaultGuiOptions . 'e'
endif
let &guioptions = g:defaultGuiOptions
" ]]]

" windows 的一些配置 [[[
if g:isWindows
  "set fileencoding=chinese
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin
  " 解决菜单乱码
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endif
" ]]]
" ]]]
" ----------- plugins config [[[
" Taglist [[[
"TlistUpdate可以更新tags
"map <F3> :silent! Tlist<CR> "按下F3就可以呼出了
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
"let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=0 "不是一直实时更新tags，因为没有必要
"let Tlist_Inc_Winwidth=30
" 这项必须设定，否则出错,配置taglist的ctags路径，不过也可以把ctags路径添
" 加进系统变量 path 里，就不用设置了
"let Tlist_Ctags_Cmd = '~/ctags.exe'
" 设置tags文件的寻找路径
"set tags += tags;
" ]]]
" Tagbar [[[
if g:isMac
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
else
  let g:tagbar_ctags_bin = 'ctags'
endif
let g:tagbar_width = 30
" ]]]
" TxtBrowser [[[
au BufEnter *.txt setlocal ft=txt
" let g:default_web_browser=chrome
" ]]]
" NeoComplate [[[
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Disable auto complete
let g:neocomplete#disable_auto_complete = 0

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" ]]]
" NeoSnippet [[[
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets"
let g:neosnippet#snippets_directory = '~/.vim/snippets/'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" ]]]
" VimShell [[[
" Use current directory as vimshell prompt.
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
" ]]]
" SuperTab [[[
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
" ]]]
" Netrw [[[
let g:netrw_winsize = 30
"输入',fe'时，就会打开一个垂直分隔的窗口浏览当前文件所在的目录，窗口的宽度为30
"nmap <silent> <leader>ntf :Sexplore!<cr>
" ]]]
" ConqueTerm [[[
let g:ConqueTerm_Color = 2
" ]]]
" gtrans.vim [[[
let g:gtrans_Engine = 'google'
"]]]
"[[[ CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_user_command = {
\   'types': {
\     1: ['.git', 'cd %s && git ls-files'],
\     2: ['.hg', 'hg --cwd %s locate -I .'],
\   },
\   'fallback': 'find %s -type f'
\ }
"]]]
" [[[ syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }

let s:syntastic_conf_folder = '~/.vim/syntastic.conf/'
let g:syntastic_coffee_coffeelint_args = '-f '.s:syntastic_conf_folder.'coffee.json'
let g:syntastic_python_pep8_args = '--ignore E401,E501,E261' "代码过长与一行import多个模块不报错
" ]]]
"[[[ PowerLine
set noshowmode
let g:Powerline_symbols = 'fancy'
"]]]
"[[[GoldenView
" split to tiled windows
nmap <silent> <C-w>n  <Plug>GoldenViewSplit
" jump to next and previous window
nmap <silent> <C-w>j  <Plug>GoldenViewNext
nmap <silent> <C-w>k  <Plug>GoldenViewPrevious
" <C-w>s split window
" <C-w>w switch between windows
" <C-w>v split windows vertically
" <C-w>c close window but save buffer
" <C-w>q quit window
" <C-w>o only view current window
"]]]
"[[[Airline
let g:airline_symbols_ascii = 1
let g:airline_theme='bubblegum'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"]]]
"[[[Tmuxline
let g:tmuxline_theme = 'airline'
let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'win': '#I:#W#F',
        \ 'cwin': '#I:#W#F',
        \ 'y': '#(uptime | sed -e "s/^.*average: //" | sed -e "s/,//g")',
        \ 'z': ['%Y-%m-%d', '%H:%M', '#22T'],
        \ 'options': {
          \'status-justify': 'left'}
        \}
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '
    \}
"]]]
"[[[ indentLine
let g:indentLine_char = '¦'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_color_term = 239
"]]]
" ]]]
" ----------- syntax setting [[[
au BufNewFile,BufRead nginx.conf set filetype=nginx " Nginx 配置文件支持
au BufNewFile,BufRead *.json set filetype=json      " JSON 后缀名支持
" ]]]
" ----------- custom shortcut [[[
" tabpage mappings commented [[[
"map <M-1> 1gt
"map <M-2> 2gt
"map <M-3> 3gt
"map <M-4> 4gt
"map <M-5> 5gt
"map <M-6> 6gt
"map <M-7> 7gt
"map <M-8> 8gt
"map <M-9> 9gt
"map <M-n> :tabnew<CR>
"map <M-c> :tabclose<CR>
" ]]]

" [[[ FuzzyFinder and CtrlP
"nmap <C-b> :FufBuffer<CR>
"nmap <C-f> :FufFile<CR>
nmap <C-c><C-p> :CtrlPClearAllCaches<CR>:CtrlP<CR>
" ]]]

" 定义快捷键 ,/ ，查找光标所在单词（可编辑），将查找出来的所有结果显示在
" quickfix 中，双击一行就能定位到文件中的相应行上
" via http://pseudo.hoop.blog.163.com/blog/static/132509117201151811727993/
nmap <Leader>/ :exec 'lvimgrep /' . input('/', expand('<cword>')) . '/j % <bar> lopen'<CR>

" <F3>改变折叠模式 [[[
map <F3> :call ToggleFoldMethod()<CR>
func! ToggleFoldMethod()
  if g:foldIsMarker==1
    set foldmethod=indent
    let g:foldIsMarker=0
    echo 'Indent foldmethod'
  else
    set foldmethod=marker
    let g:foldIsMarker=1
    echo 'Marker foldmethod'
  endif
endfunc
" ]]]
" <F4>进行版权声明 authorinfo [[[
nmap <F4> :AuthorInfoDetect<CR>
" ]]]
" <F5> PEP8 语法检查
" <F6>打开 Mru [[[
map <silent> <F6> :Mru<CR>
" ]]]
" <F8>打开 Taglist 或者 Tagbar [[[
nmap <silent> <F8> :TagbarToggle<CR>
" ]]]
" <F9>判定/打开 NERDtree [[[
map <silent> <F9> :NERDTree<CR>
" ]]]
" <F10> 调出 File 菜单
" <F11> 在很多 DWM 里是作为软件全屏的快捷键的
" <F12> 呼出/隐藏 工具栏 [[[
map <silent> <F12> :call CallManu()<CR>
function! CallManu()
  let newGuiOptions = g:defaultGuiOptions
  if !&guioptions =~# 'm'
    let newGuiOptions = g:defaultGuiOptions + 'm'
  endif
    let &guioptions = newGuiOptions
endfunction
" ]]]

" 在可视模式下，<TAB> 等于 >，<S-TAB> 等于 <
vmap <silent> <TAB> >
vmap <silent> <S-TAB> <

au BufWritePost nginx.conf exe '!sudo nginx -s reload'

" edit from http://www.vim.org/scripts/script.php?script_id=3341
au FileType python,ruby,sh,cpp,c,cc,h,html :call Cc()
au FileType c,cc,cpp,h,html,python,javascript,coffee :call AutoSpace()
func! AutoSpace() "[[[
  "ino , ,<SPACE>
  "ino : :<SPACE>
  "ino { <SPACE>{
  "ino ( <SPACE>(
  "ino ; ;<SPACE>
  "ino =<SPACE> <SPACE>=<SPACE>
  "ino <<SPACE> <SPACE><<SPACE>
  "ino ><SPACE> <SPACE>><SPACE>
  "ino +<SPACE> <SPACE>+<SPACE>
  "ino -<SPACE> <SPACE>-<SPACE>
  "ino *<SPACE> <SPACE>*<SPACE>
  "ino /<SPACE> <SPACE>/<SPACE>
  ino !=<SPACE> <SPACE>!=<SPACE>
  ino <=<SPACE> <SPACE><=<SPACE>
  ino *=<SPACE> <SPACE>*=<SPACE>
  ino /=<SPACE> <SPACE>/=<SPACE>
  ino >><SPACE> <SPACE>>><SPACE>
  ino <<<SPACE> <SPACE><<<SPACE>
  ino >=<SPACE> <SPACE>>=<SPACE>
  ino ==<SPACE> <SPACE>==<SPACE>
  ino +=<SPACE> <SPACE>+=<SPACE>
  ino -=<SPACE> <SPACE>-=<SPACE>
  ino &&<SPACE> <SPACE>&&<SPACE>
  ino ===<SPACE> <SPACE>===<SPACE>
  ino !==<SPACE> <SPACE>!==<SPACE>
endf
"]]]
func! Cc() "[[[
  if exists('$DISPLAY')
    nm JJ :call DebugInGui()<CR>
    im JJ <ESC> :call DebugInGui()<CR>
  el
    im JJ <ESC> :call DebugInTerminal()<CR>
    nm JJ :call DebugInTerminal()<CR>
  en
endf
"]]]
func! DebugInGui() "[[[
  exe 'w'
  if &filetype == 'c'
    exe '!gcc -Wall % -o %<'
    exe '!clear;./%< 2>/dev/null && rm -f %<'
  elsei &filetype == 'cpp'
    exe '!g++ -Wall % -o %<'
    exe '!clear;./%< 2>/dev/null && rm -f %<'
  elsei &filetype == 'python'
    exe '!clear;python %'
  elsei &filetype == 'ruby'
    exe '!clear;ruby  %'
  elsei &filetype == 'sh'
    exe '!clear;bash %'
  elsei &filetype == 'perl'
    exe '!clear;perl %'
  en
endf
"]]]
func! DebugInTerminal() "[[[
  exe 'w'
  if &filetype == 'c'
    exe '!gcc -Wall % -o %<'
    exe '!./%< 2>/dev/null && rm -f %<'
  elsei &filetype == 'cpp'
    exe '!g++ -Wall % -o %<'
    exe '!./%< 2>/dev/null && rm -f %<'
  elsei &filetype == 'python'
    exe '!python %'
  elsei &filetype == 'ruby'
    exe '!ruby  %'
  elsei &filetype == 'sh'
    exe '!bash %'
  elsei &filetype == 'perl'
    exe '!perl %'
  elsei &filetype =='html'
    exe '!firefox %'
  en
endf
"]]]
" ]]]
