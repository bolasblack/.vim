"----------- base setting -----------
colorscheme lilypink                   " 设置主题
let mapleader = ','                    " Set mapleader
set linebreak                          " 不在单词中间断行
set formatoptions+=mB                  " 打开断行模块对亚洲语言支持
set autochdir                          " 自动载入当前编辑文件的目录
set guioptions=                        " 简洁界面
"set ignorecase                         " 忽略大小写匹配
set scrolloff=10                       " 设置光标距离上下边界的距离
set showcmd                            " 在窗口右下角显示完整命令已输入部分
set cursorline                         " 高亮光标所在行
set nocompatible                       " 不要vim模仿vi模式
set number                             " 显示行号
set guifont=YaHei\ Consolas\ Hybrid\ 9 " 设置雅黑字体
" edit from http://www.vim.org/scripts/script.php?script_id=3341
set backspace=2                        " 允许在插入开始的位置上退格；CTRL-W 和 CTRL-U 到达插入开始的位置时停留一次
set autoindent                         " 自动缩进
set smartindent                        " 智能缩进
"set incsearch                          " 搜索时显示目前输入模式的匹配位置
"set cindent                            " 自动 C 程序缩进
set showmode                           " 显示当前模式
set wildmenu                           " 增强模式命令行补全
set magic                              " 改变搜索模式使用的特殊字符，打开就好，只有在 Vi 里才需要关掉
"set exrc                              " 允许读入当前目录的 .vimrc .exrc .gvimrc

" 让一个tab等于4个空格
set expandtab
set tabstop=4     " <TAB> 代表的空格数
set shiftwidth=4  " （自动）缩进使用的空白数目
set softtabstop=4 " 编辑时把 <TAB> 当作的空格数目

" 高亮语法
syntax on
behave mswin
filetype plugin on

" 启动时默认大小 {{{
" 不论什么方法启动都是这个尺寸
set lines=44 columns=84

" GUI 启动方式尺寸
"au GUIEnter * set lines=140 columns=82

" 分启动方式设定尺寸
if has("gui_running")
  " GUI is running or is about to start.
  " set gvim window size
"  set lines=140 columns=82
else
  " This is console Vim.
  if exists("+lines")
"    set lines=140
  endif
  if exists("+columns")
"    set columns=82
  endif
endif

" 启动后最大化
" Maximize gvim on startup. Note we Dutch must use ~m, English/American people use ~x
"au GUIEnter * simalt ~x
"au GUIEnter * simalt ~m
"au GUIEnter * simalt ~v
"}}}

" 以特定标记作为折叠规则
let g:foldIsMarker=1
set foldmethod=marker

" encoding
set encoding=utf-8
set termencoding=utf-8

"判定当前操作系统类型 {{{
if(has("win32") || has("win95") || has("win64") || has("win16")) 
    "set fileencoding=chinese
    let g:iswindows=1
	language messages zh_CN.utf-8
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
	" 解决菜单乱码
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
else
    set fileencoding=utf-8
    let g:iswindows=0
endif
set langmenu=zh_CN.utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" }}}

" 取消自动备份功能
set nobackup
set nowritebackup
