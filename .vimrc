" ----------- path variable setting [[[
if has('win32')
  let $vim = $VIM.'/vimfiles'
else
  let $vim = $HOME.'/.vim'
endif
let $v = $vim.'/.vimrc'
let $rc = $vim.'/.vimrc'
" ]]]
" ----------- environment [[[
let g:isMac=0
let g:isLinux=0
let g:isTerminal=0
let g:isWindows=0
let g:isCmd=0
if !has('unix')
  let g:isWindows=1
  if !has('gui_running')
    let g:isCmd=1
  endif
else
  if !has('gui_running')
    let g:isTerminal=1
  else
    if !has('mac')
      let g:isLinux=1
    else
      let g:isMac=1
    endif
  endif
endif
function! Env()
  echo 'isMac: '      . g:isMac
  echo 'isLinux: '    . g:isLinux
  echo 'isTerminal: ' . g:isTerminal
  echo 'isWndows: '   . g:isWindows
  echo 'isCmd: '      . g:isCmd
endfunction
" ]]]
" ----------- Plugin Manager Config [[[

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
" neobundle asynchronous update/install
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" base 
" 快速查找的工具，可以配合 Neobundle 查找插件，十分好用
NeoBundle 'Shougo/unite.vim'
" vim shell
NeoBundle 'Shougo/vimshell.vim'
" 给vim增加url的识别功能，当然功能远远不止这些
NeoBundle 'utl.vim'
" 自动添加作者信息
NeoBundle 'AuthorInfo'
" 在默认启动界面显示最近打开过的文件等
NeoBundle 'mhinz/vim-startify'
" 快速给单词/句子两边增加符号（包括html标签），缺点是不用用'.'来重复命令，repeat.vim可以解决这个问题
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
" 提供命令模式和高亮模式下的补全，通过 C-n | C-p 补全缓冲区中出现过的单词
NeoBundle 'CmdlineComplete'
" Undo tree
NeoBundle 'Gundo'
" 高亮对应的标点，如 [] {}
NeoBundle 'matchparenpp'
" supertab
NeoBundle 'ervandew/supertab'
" 标点对齐
NeoBundle 'godlygeek/tabular'
" 目录树
NeoBundle 'scrooloose/nerdtree'
" 多国语翻译为指定语言的插件
NeoBundle 'bolasblack/gtrans.vim'
" vim 中文文档
"NeoBundle 'bolasblack/vimcdoc'
" 漂亮的 mode line
" Monaco for Powerline  https://gist.github.com/baopham/1838072
" Powerline fonts       https://github.com/Lokaltog/powerline-fonts
NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
" 自动闭合标点
NeoBundle 'Raimondi/delimitMate'
" 在 Vim 中使用 sudo
NeoBundle 'sudo.vim'
" 打开文件时自动检测文件编码，似乎在 Mac 下会出现问题，检测编码出错
"if !g:isMac
  "NeoBundle 'FencView.vim' 
"endif

" quick edit
" 强大的自动补全
NeoBundle 'Shougo/neocomplete'
" 代码片段引擎
NeoBundle 'Shougo/neosnippet'
" 代码片段模板
NeoBundle 'honza/vim-snippets'
" 快速移动光标到指定位置
NeoBundle 'Lokaltog/vim-easymotion'
" 一个更好用的 grep ，需要安装 ack
NeoBundle 'mileszs/ack.vim'
" 比 dwn 更可配置的的平铺窗口管理
NeoBundle 'zhaocai/GoldenView.Vim'
" automatically search for & insert URL targets for links in Markdown & ReST
NeoBundle 'sampsyo/autolink.vim'
" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
NeoBundle 'tpope/vim-speeddating'
" FuzzyFinder 必须的库
NeoBundle 'L9'
" 快速找到、打开文件
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
" 用于快速的打开文件和跳转 Buffer
NeoBundle 'kien/ctrlp.vim'
" CtrlP 用于快速打开本项目文件，FuzzyFinder用于打开其他文件


" coding
" 代码浏览工具，似乎更适合 C 
" *依赖 Vim 插件 TxtBrowser *
"NeoBundle 'taglist.vim'
" 文本浏览工具，不过最近的版本会导致无法查阅 Vim 的帮助文档，所以不再使用
"NeoBundle 'TxtBrowser'
" 代码浏览工具，更适合 OO 语言，由于不明原因，会与 powerline 冲突
"NeoBundle 'majutsushi/tagbar'
" 写 Doxygen 风格注释
NeoBundle 'DoxygenToolkit.vim'
" 代码注释工具
NeoBundle 'tomtom/tcomment_vim'
" 在 Vim 里快捷的使用 Git
NeoBundle 'tpope/vim-fugitive'
" 一个 quicklist 来显示标注有 TODO: 的行
NeoBundle 'TaskList.vim'
" 多语言语法检查
NeoBundle 'scrooloose/syntastic'
" Gist 支持
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}


" Python
" 提供 python 的语法缩进，比默认的要好很多(vimer.cn修改)
"NeoBundle 'indentpython.vim--nianyang'
" 为编写 Python 代码作的一些快捷键，比如选择一个代码块等
"NeoBundle 'python.vim'
" 更好的 Python 语法高亮
"NeoBundle 'python.vim--Vasiliev'
" 基于 PEP8 的 Python 代码风格检查插件
" *依赖 Python 的第三方包 PEP8 *
"NeoBundle 'jbking/vim-pep8'


" Ruby
" rails 支持
"NeoBundle 'tpope/vim-rails'
" 自动输入 end
"NeoBundle 'tpope/vim-endwise'
" ruby 支持
"NeoBundle 'vim-ruby/vim-ruby'


" Language
" 提供 markdown 着色功能，顺便也提供了 snippet
NeoBundle 'hallison/vim-markdown'
" mustache 支持
NeoBundle 'juvenn/mustache.vim'
" 提供 JSON 的语法高亮
NeoBundle 'JSON.vim'
" coffeeScript 支持
NeoBundle 'kchmck/vim-coffee-script'
" Stylus 支持
NeoBundle 'wavded/vim-stylus'
" Jade 高亮
NeoBundle 'digitaltoad/vim-jade'
" Less css 高亮
NeoBundle 'groenewege/vim-less'
" nginx 语法高亮
NeoBundle 'nginx.vim'
" Jinja 语法
NeoBundle 'Jinja'
" Mako 语法
NeoBundle 'mako.vim'


" Front
" zencoding
NeoBundle 'mattn/emmet-vim'
" 美化js代码，并不是简单的缩进，而是整个优化
NeoBundle 'jsbeautify'
" 在 CSS 文件中实时显示色彩，如 #eaeaea，或者 red
if !g:isTerminal
  NeoBundle 'css_color.vim'
endi
" 高亮对应的 HTML 标签
NeoBundle 'gregsexton/MatchTag'
" 按 % 可以跳转到对应的标点或标签
NeoBundle 'matchit.zip'
" csslint 的 Vim 插件
NeoBundle 'bolasblack/csslint.vim'
" brunch 约定的文件组织方式的支持
NeoBundle 'drichard/vim-brunch'

"" non github repos
"" 快速的文件导航，可以在要打开文件或者在如入路径的时候按 command-t 试试看
"" 但是和 CtrlP.vim 重复了，所以干掉
""NeoBundle 'git://git.wincent.com/command-t.git'

NeoBundleCheck
" ]]]
" ----------- base setting [[[
" 高亮语法
syntax on
behave mswin
filetype plugin indent on
" 设置主题
colorscheme lucius "lilypink

"set runtimepath+=~/.vim/vimcdoc/trunk/

let mapleader = ','   " Set mapleader
set linebreak         " 不在单词中间断行
set formatoptions+=mB " 打开断行模块对亚洲语言支持
set guioptions=       " 简洁界面
"set ignorecase        " 忽略大小写匹配
set scrolloff=10      " 设置光标距离上下边界的距离
set showcmd           " 在窗口右下角显示完整命令已输入部分
set cursorline        " 高亮光标所在行
set nocompatible      " 不要vim模仿vi模式
set number            " 显示行号
set visualbell        " 不要 beep 也不要闪屏
set laststatus=2      " Always show the statusline
set autoread          " 正在编辑的文件在外部被修改后自动读取
set helplang=cn       " 帮助文件语言为中文
set noautochdir       " 不自动载入当前编辑文件的目录

" 以特定标记作为折叠规则
let g:foldIsMarker=1
set foldmethod=marker
set foldmarker=[[[,]]]                 " 用 [[[ ]]] 替代 {{{ }}}

" 取消自动备份功能
set nobackup
set nowritebackup

" 缩进提示
" [Show invisibles](http://vimcasts.org/episodes/show-invisibles/)
" [语虚](http://yyq123.blogspot.tw/2011/11/vim-listchars.html)
set list
set listchars=tab:>>,trail:-,eol:¬

" modified from http://www.vim.org/scripts/script.php?script_id=3341
set backspace=2                        " 允许在插入开始的位置上退格；CTRL-W 和 CTRL-U 到达插入开始的位置时停留一次
set autoindent                         " 自动缩进
set nosmartindent                      " 智能缩进，对 C 系的还行，其他的语言还是建议关闭
set incsearch                          " 增量搜索, 搜索时显示目前输入模式的匹配位置
set hlsearch                           " 高亮搜索结果
set showmode                           " 显示当前模式
set wildmenu                           " 增强模式命令行补全
set magic                              " 改变搜索模式使用的特殊字符，打开就好，只有在 Vi 里才需要关掉
"set exrc                              " 允许读入当前目录的 .vimrc .exrc .gvimrc
"set cindent                            " 自动 C 程序缩进

" 自定义光标形态，不闪烁
set gcr=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor-blinkon0,o:hor50-Cursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon0,r-cr:hor20-Cursor/lCursor-blinkon0,sm:block-Cursor-blinkon0

" encoding
set encoding=utf-8
set termencoding=utf-8
set langmenu=zh_CN.utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
language message zh_CN.UTF-8
if g:isCmd
  set encoding=chinese " 设置命令提示符下vim不乱码 
  set termencoding=chinese " 终端下的编码，对gvim来说没有必要设置 
endif

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

" [[[ 缩进设置
set expandtab     " 缩进用空格还是制表符表示
set tabstop=2     " <TAB> 代表的空格数
set shiftwidth=2  " （自动）缩进使用的空白数目
set softtabstop=2 " 编辑时按退格键的时候退回缩进的长度
" 演示可以看一下 [Tabs and Spaces](http://vimcasts.org/episodes/tabs-and-spaces/)
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
" ----------- syntax setting [[[
let g:todo_keyword = ["TODO", "FIX"]
let g:warning_keyword = ["WARNING"]

au BufNewFile,BufRead nginx.conf set filetype=nginx " Nginx 配置文件支持
au BufNewFile,BufRead *.json set filetype=json      " JSON 后缀名支持
" ]]]
" ----------- Custom Shortcut [[[
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
" ----------- Normal Plugins Configure [[[
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
let g:vimrc_author='c4605' 
let g:vimrc_email='bolasblack@gmail.com' 
let g:vimrc_homepage='http://plafer.info' 
" ]]]
" Tagbar 配置 [[[
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
" ]]]
" Doxygen 配置 [[[
let g:DoxygenToolkit_briefTag_funcName = 'yes'
let g:Doxygen_enhanced_color = 1
let g:DoxygenToolkit_authorName = 'c4605 bolasblack[at]gmail.com'
let g:DoxygenToolkit_licenseTag = 'Do any thing you like'
let g:DoxygenToolkit_blockHeader = '======================================='
let g:DoxygenToolkit_briefTag_pre = '@Description:'
let g:DoxygenToolkit_paramTag_pre = '@Param:'
let g:DoxygenToolkit_returnTag_pre = '@Return:'
let g:DoxygenToolkit_blockFooter = '======================================='
" ]]]
" TxtBrowser 设置 [[[
au BufEnter *.txt setlocal ft=txt
" let g:default_web_browser=chrome
" ]]]
" NeoComplate 设置 [[[
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
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
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
" NeoSnippet 设置 [[[
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets"
let g:neosnippet#snippets_directory = '~/.vim/snippets/'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" ]]]
" VimShell 设置 [[[
" Use current directory as vimshell prompt.
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
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
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
"]]]
"[[[ gjsLint
" gjsLint
" 由 jsLint http://www.vim.org/scripts/script.php?script_id=2729 修改而来
" 修改文件在 https://github.com/ktmud/vim-unix/raw/master/.vim/ftplugin/javascript/
" 作者文章：http://wiki.ktmud.com/tips/Vim.html

"]]]
" [[[ syntastic
let g:syntastic_check_on_open=1
" ]]]
"[[[ PowerLine
set noshowmode
let g:Powerline_symbols = 'fancy'
"]]]
"[[[syntastic
let s:syntastic_conf_folder = '~/.vim/syntastic.conf/'
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }

let g:syntastic_coffee_lint_options = '-f '.s:syntastic_conf_folder.'coffee.json'
"]]]
"[[[Tasklist
let g:tlTokenList = []
call extend(g:tlTokenList, g:todo_keyword)
call extend(g:tlTokenList, g:warning_keyword)
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
"[[[TComment
call tcomment#DefineType('sql_block', g:tcommentBlockC)
call tcomment#DefineType('coffee_block', {'commentstring': '###%s###'})
"]]]
"[[[Gist
if g:isMac
  let g:gist_clip_command = 'pbcopy'
else
  if g:isLinux
    let g:gist_clip_command = 'xclip -selection clipboard'
  endif
endif
"]]]
" ]]]
