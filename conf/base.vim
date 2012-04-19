" ----------- base setting ----------- [[[
let mapleader = ','                    " Set mapleader
set linebreak                          " 不在单词中间断行
set formatoptions+=mB                  " 打开断行模块对亚洲语言支持
set autochdir                          " 自动载入当前编辑文件的目录
set guioptions=                        " 简洁界面
"set ignorecase                        " 忽略大小写匹配
set scrolloff=10                       " 设置光标距离上下边界的距离
set showcmd                            " 在窗口右下角显示完整命令已输入部分
set cursorline                         " 高亮光标所在行
set nocompatible                       " 不要vim模仿vi模式
set number                             " 显示行号
set visualbell                         " 不要 beep 也不要闪屏
set foldmarker=[[[,]]]                 " 用 [[[ ]]] 替代 {{{ }}}

" 简陋的运行环境判断 [[[
let g:isMac=0
let g:isCmd=0
let g:isLinux=0
let g:isWindows=0
let g:isTerminal=0
if !has("unix")
    let g:isWindows=1
    if !has("gui_running")
        let g:isCmd=1
    endif
else
    if !has("gui_running")
        let g:isTerminal=1
    else
        if !has("mac")
            let g:isLinux=1
        else
            let g:isMac=1
        endif
    endif
endif
function Env()
    echo "isMac: "      . g:isMac
    echo "isCmd: "      . g:isCmd
    echo "isLinux: "    . g:isLinux
    echo "isWndows: "   . g:isWindows
    echo "isTerminal: " . g:isTerminal
endfunction
" ]]]

if &term =~ "screen"
    set t_Co=256
endif

" 设置主题
colorscheme lucius "lilypink

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

" modified from http://www.vim.org/scripts/script.php?script_id=3341
set backspace=2                        " 允许在插入开始的位置上退格；CTRL-W 和 CTRL-U 到达插入开始的位置时停留一次
set autoindent                         " 自动缩进
set smartindent                        " 智能缩进
set incsearch                          " 增量搜索, 搜索时显示目前输入模式的匹配位置
set hlsearch                           " 高亮搜索结果
set showmode                           " 显示当前模式
set wildmenu                           " 增强模式命令行补全
set magic                              " 改变搜索模式使用的特殊字符，打开就好，只有在 Vi 里才需要关掉
"set exrc                              " 允许读入当前目录的 .vimrc .exrc .gvimrc
"set cindent                            " 自动 C 程序缩进

" 自定义光标形态，不闪烁
set gcr=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor-blinkon0,o:hor50-Cursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon0,r-cr:hor20-Cursor/lCursor-blinkon0,sm:block-Cursor-blinkon0

" [[[ 缩进设置
set expandtab     " 缩进用空格还是制表符表示
set tabstop=4     " <TAB> 代表的空格数
set shiftwidth=4  " （自动）缩进使用的空白数目
set softtabstop=4 " 编辑时按退格键的时候退回缩进的长度
au! FileType {json,html,css,stylus,coffee,javascript,ruby} setlocal ts=2 sts=2 sw=2
" 演示可以看一下 [Tabs and Spaces](http://vimcasts.org/episodes/tabs-and-spaces/)
" ]]]

" encoding
set encoding=utf-8
set termencoding=utf-8
set langmenu=zh_CN.utf-8
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
language message zh_CN.UTF-8
if g:isCmd
    set encoding=chinese " 设置命令提示符下vim不乱码 
    set termencoding=chinese     "终端下的编码，对gvim来说没有必要设置 
endif

" 高亮语法
syntax on
behave mswin
filetype plugin on

" 以特定标记作为折叠规则
let g:foldIsMarker=1
set foldmethod=marker

" 取消自动备份功能
set nobackup
set nowritebackup

" 缩进提示
set list
set listchars=tab:▸\ ,eol:¬
" 演示可以看 [Show invisibles](http://vimcasts.org/episodes/show-invisibles/)

" 启动时默认大小 [[[
" 不论什么方法启动都是这个尺寸
"set lines=44 columns=84

" GUI 启动方式尺寸
"au GUIEnter * set lines=44 columns=84

" 分启动方式设定尺寸
if has("gui_running")
   set columns=82
else
  " This is console Vim.
  if exists("+lines")
"    set lines=140
  endif
  if exists("+columns")
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

au BufNewFile,BufRead *.todo set syntax=Todo        " todo 后缀名支持
au BufNewFile,BufRead *.json set filetype=json      " JSON 后缀名支持
au BufNewFile,BufRead *.t2t set filetype=txt2tags   " t2t 后缀名支持
au BufNewFile,BufRead *.mhtml set filetype=mustache " mustache 模版语言对 HTML 文件的支持

" auto mkdir [[[
" Copy from https://github.com/DataWraith/auto_mkdir
augroup auto_mkdir
    au!
    au BufWritePre,FileWritePre * call <SID>auto_mkdir()
augroup END

function <SID>auto_mkdir()
    " Get directory the file is supposed to be saved in
    let s:dir = expand("<afile>:p:h")

    " Create that directory (and its parents) if it doesn't exist yet
    if !isdirectory(s:dir)
        call mkdir(s:dir, "p")
    endif
endfunction
" ]]]

" markdown syntax settings
"augroup mkd
    "autocmd BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set ai formatoptions=tcroqn2 comments=n:>
    "autocmd BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set wrap nonumber
"augroup END

" ]]]
"----------- Custom Shortcut -------- [[[
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
nmap <C-b> :FufBuffer<CR>
nmap <C-f> :FufFile<CR>
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

" 模拟 Emacs 按键绑定
nm <C-x><C-m> :
im <C-x><C-m> <ESC>:
cmap <C-g> <ESC>

" 在可视模式下，<TAB> 等于 >，<S-TAB> 等于 <
vmap <silent> <TAB> >
vmap <silent> <S-TAB> <

im jj <ESC>
im JJ <ESC>:w<CR>
" edit from http://www.vim.org/scripts/script.php?script_id=3341
au FileType python,ruby,sh,cpp,c,cc,h,html :call Cc()
au FileType c,cc,cpp,h,html,python,javascript,coffee :call AutoSpace()
func! AutoSpace() "[[[
    ino , ,<SPACE>
    ino : :<SPACE>
    "ino { <SPACE>{
    "ino ( <SPACE>(
    "ino ; ;<SPACE>
    ino =<SPACE> <SPACE>=<SPACE>
    ino <<SPACE> <SPACE><<SPACE>
    ino ><SPACE> <SPACE>><SPACE>
    ino +<SPACE> <SPACE>+<SPACE>
    ino -<SPACE> <SPACE>-<SPACE>
    ino *<SPACE> <SPACE>*<SPACE>
    ino /<SPACE> <SPACE>/<SPACE>
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
	if exists("$DISPLAY")
        nm mm :call DebugInGui()<CR>
        im mm <ESC> :call DebugInGui()<CR>
	el
		im mm <ESC> :call DebugInTerminal()<CR>
		nm mm :call DebugInTerminal()<CR>
	en
endf
"]]]
func! DebugInGui() "[[[
	exe "w"
	if &filetype == 'c'
		exe "!gcc -Wall % -o %<"
		exe "!clear;./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'cpp'
		exe "!g++ -Wall % -o %<"
		exe "!clear;./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'python'
		exe "!clear;python %"
	elsei &filetype == 'ruby'
		exe "!clear;ruby  %"
	elsei &filetype == 'sh'
		exe "!clear;bash %"
	elsei &filetype == 'perl'
		exe "!clear;perl %"
	en
endf
"]]]
func! DebugInTerminal() "[[[
	exe "w"
	if &filetype == 'c'
		exe "!gcc -Wall % -o %<"
		exe "!./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'cpp'
		exe "!g++ -Wall % -o %<"
		exe "!./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'python'
		exe "!python %"
	elsei &filetype == 'ruby'
		exe "!ruby  %"
	elsei &filetype == 'sh'
		exe "!bash %"
	elsei &filetype == 'perl'
		exe "!perl %"
	elsei &filetype =='html'
		exe "!firefox %"
	en
endf
"]]]
"]]]
"----------- Normal Plugins Configure [[[
" Taglist 配置 [[[
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
" AuthorInfo 配置 [[[
let g:vimrc_author='yicuan' 
let g:vimrc_email='bolasblack@gmail.com' 
let g:vimrc_homepage='http://plafer.tk' 
" ]]]
" Tagbar 配置 [[[
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
" ]]]
" Doxygen 配置 [[[
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:Doxygen_enhanced_color = 1
let g:DoxygenToolkit_authorName = "yicuan bolasblack[at]gmail.com"
let g:DoxygenToolkit_licenseTag = "Do any thing you like"
let g:DoxygenToolkit_blockHeader = "======================================="
let g:DoxygenToolkit_briefTag_pre = "@Description:"
let g:DoxygenToolkit_paramTag_pre = "@Param:"
let g:DoxygenToolkit_returnTag_pre = "@Return:"
let g:DoxygenToolkit_blockFooter = "======================================="
" ]]]
" TxtBrowser 设置 [[[
au BufEnter *.txt setlocal ft=txt
" let g:default_web_browser=chrome
" ]]]
" Zen Coding 配置 [[[
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
" ]]]
" NeoComplcache 设置 [[[
" Use neocomplcache. 
let g:neocomplcache_enable_at_startup = 1
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 0 
" Use underbar completion. 
let g:neocomplcache_enable_underbar_completion = 0 
" Set minimum syntax keyword length. 
let g:neocomplcache_min_syntax_length = 3 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' 
" 不自动弹出补全列表
let g:NeoComplCache_DisableAutoComplete = 1

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
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" 
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
" ]]]
" SuperTab 设置 [[[
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
" ]]]
" Netrw 设置 [[[
let g:netrw_winsize = 30
"输入',fe'时，就会打开一个垂直分隔的窗口浏览当前文件所在的目录，窗口的宽度为30
"nmap <silent> <leader>ntf :Sexplore!<cr> 
" ]]]
" ConqueTerm 设置 [[[
let g:ConqueTerm_Color = 2
" ]]]
" PEP8.vim 设置 [[[
let g:pep8_ignore = 'E401,E501,E261' "代码过长与一行import多个模块不报错
" ]]]
" gtrans.vim 设置 [[[
let g:gtrans_Engine = 'google'
"]]]
"[[[ CtrlP 设置
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"]]]
"[[[ Indent Guides 设置
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_space_guides = 1
let g:indent_guides_color_change_percent = 10
let g:indent_guides_enable_on_vim_startup = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"]]]
"[[[ gjsLint
" gjsLint
" 由 jsLint http://www.vim.org/scripts/script.php?script_id=2729 修改而来
" 修改文件在 https://github.com/ktmud/vim-unix/raw/master/.vim/ftplugin/javascript/
" 作者文章：http://wiki.ktmud.com/tips/Vim.html

"]]]
"]]]
