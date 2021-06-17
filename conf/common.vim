" ----------- base config [[[
let mapleader = ','   " Set mapleader
set linebreak         " 不在单词中间断行
set formatoptions+=mB " 打开断行模块对亚洲语言支持
"set ignorecase        " 忽略大小写匹配
set scrolloff=10      " 设置光标距离上下边界的距离
set nocompatible      " 不要vim模仿vi模式
set helplang=cn       " 帮助文件语言为中文

" 取消自动备份功能
set nobackup
set nowritebackup

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

" encoding [[[
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if g:isCmd
  set encoding=chinese " 设置命令提示符下vim不乱码
  set termencoding=chinese " 终端下的编码，对gvim来说没有必要设置
endif
" ]]]

" [[[ indentation
set expandtab     " 缩进用空格还是制表符表示
set tabstop=2     " <TAB> 代表的空格数
set shiftwidth=2  " （自动）缩进使用的空白数目
set softtabstop=2 " 编辑时按退格键的时候退回缩进的长度
" 演示可以看一下 [Tabs and Spaces](http://vimcasts.org/episodes/tabs-and-spaces/)
" ]]]

" ]]]
" ----------- plugins config [[[
" AuthorInfo [[[
let g:vimrc_author='c4605'
let g:vimrc_email='bolasblack@gmail.com'
let g:vimrc_homepage='http://plafer.info'
" ]]]
" Doxygen [[[
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
"[[[Tasklist
let g:todo_keyword = ["TODO", "FIX"]
let g:warning_keyword = ["WARNING"]
let g:tlTokenList = []
call extend(g:tlTokenList, g:todo_keyword)
call extend(g:tlTokenList, g:warning_keyword)
"]]]
"[[[TComment
call tcomment#type#Define('sql_block', g:tcomment#block2_fmt_c)
call tcomment#type#Define('coffee_block', {'commentstring': '###%s###'})
"]]]
"[[[Gist
if g:isMac
  let g:gist_clip_command = 'pbcopy'
else
  if g:isLinux
    let g:gist_clip_command = 'xclip -selection clipboard'
  endif
endif
" Only :w! updates a gist.
let g:gist_update_on_write = 2
"]]]
"[[[delimitMate
let g:delimitMate_balance_matchpairs=1
"]]]
" ]]]
