"----------- base setting -----------
" 启用 Pathhogen
call pathogen#runtime_append_all_bundles()

" 高亮语法
syntax on
behave mswin
filetype plugin on

"不在单词中间断行
set lbr

"打开断行模块对亚洲语言支持
set fo+=mB

" 自动载入当前编辑文件的目录
set autochdir

" 简洁界面
let g:havemanu=0
set go=

" 不要vim模仿vi模式
set nocompatible

" 让一个tab等于4个空格
set shiftwidth=4
set softtabstop=4

" 显示行号
set number

" 启动时默认大小 {{{
" 不论什么方法启动都是这个尺寸
set lines=140 columns=82

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
set foldmethod=marker

" encoding
set encoding=utf-8
set termencoding=utf-8

"判定当前操作系统类型
if(has("win32") || has("win95") || has("win64") || has("win16")) 
    let g:iswindows=1
else
    let g:iswindows=0
endif

if g:iswindows==1
    set fileencoding=utf-8
	"language messages zh_cn.utf-8
else
    set fileencoding=utf-8
endif
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.utf-8
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim

"设置雅黑字体
set guifont=YaHei\ Consolas\ Hybrid\ 8
"set guifont=Lucida\ Console:h8

" 取消自动备份功能
set nobackup
set nowritebackup

" 设置主题
colorscheme lilypink 

" Set mapleader
let mapleader = ","
