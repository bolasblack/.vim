"----------- Plugin Manager Config -----------
set rtp+=~/.vimVundle/vundle/
call vundle#rc('~/.vimVundle')

" base 
" required! 用 vundle 管理 vundle
Bundle 'gmarik/vundle'
" 给vim增加url的识别功能，当然功能远远不止这些
Bundle 'utl.vim'
" 自动添加作者信息
Bundle 'AuthorInfo'
" 快速给单词/句子两边增加符号（包括html标签），缺点是不用用"."来重复命令，repeat.vim可以解决这个问题
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
" 提供命令模式和高亮模式下的补全，通过 C-n | C-p 补全缓冲区中出现过的单词
Bundle 'CmdlineComplete'
" Undo tree
Bundle 'Gundo'
" 高亮对应的标点，如 [] {}
Bundle 'matchparenpp'
"强大的自动补全
Bundle 'Shougo/neocomplcache'
" supertab
Bundle 'ervandew/supertab'
" 标点对齐
Bundle 'godlygeek/tabular'
" 目录树
Bundle 'scrooloose/nerdtree'
" 在 Vim 中运行 Shell，vim-script 备份的那个没有Python的文件
Bundle 'rson/vim-conque'
" 多国语翻译为指定语言的插件
Bundle 'bolasblack/gtrans.vim'
" vim 中文文档
Bundle "bolasblack/vimcdoc"
" 漂亮的 mode line
Bundle "Lokaltog/vim-powerline"
" 自动闭合标点
Bundle "Raimondi/delimitMate"
" 在 Vim 中使用 sudo
Bundle "sudo.vim"
" 打开文件时自动检测文件编码，似乎在 Mac 下会出现问题，检测编码出错
"if !g:isMac
  "Bundle 'FencView.vim' 
"endif

" quick edit
" 快速移动光标到指定位置
Bundle 'Lokaltog/vim-easymotion'
" 一个更好用的 grep ，需要安装 ack
Bundle "mileszs/ack.vim"
" Vim 的平铺窗口管理
Bundle "spolu/dwm.vim"
" FuzzyFinder 必须的库
Bundle 'L9'
" 快速找到、打开文件
Bundle 'FuzzyFinder'
" 用于快速的打开文件和跳转 Buffer
Bundle 'kien/ctrlp.vim'
" CtrlP 用于快速打开本项目文件，FuzzyFinder用于打开其他文件


" coding
" 代码浏览工具，似乎更适合 C 
" *依赖 Vim 插件 TxtBrowser *
"Bundle 'taglist.vim'
" 文本浏览工具，不过最近的版本会导致无法查阅 Vim 的帮助文档，所以不再使用
"Bundle 'TxtBrowser'
" 代码浏览工具，更适合 OO 语言，由于不明原因，会与 powerline 冲突
"Bundle 'majutsushi/tagbar'
" 写 Doxygen 风格注释
Bundle 'DoxygenToolkit.vim'
" 代码注释工具
Bundle 'scrooloose/nerdcommenter'
" 代码片段引擎
Bundle 'drmingdrmer/xptemplate'
" 在 Vim 里快捷的使用 Git
Bundle 'tpope/vim-fugitive'
" 一个 quicklist 来显示标注有 TODO: 的行
Bundle 'TaskList.vim'
" 多语言语法检查
Bundle 'scrooloose/syntastic'


" Python
" 提供 python 的语法缩进，比默认的要好很多(vimer.cn修改)
"Bundle 'indentpython.vim--nianyang'
" 为编写 Python 代码作的一些快捷键，比如选择一个代码块等
"Bundle 'python.vim'
" 更好的 Python 语法高亮
"Bundle 'python.vim--Vasiliev'
" 基于 PEP8 的 Python 代码风格检查插件
" *依赖 Python 的第三方包 PEP8 *
"Bundle 'jbking/vim-pep8'


" Ruby
" rails 支持
"Bundle 'tpope/vim-rails'
" 自动输入 end
"Bundle 'tpope/vim-endwise'
" ruby 支持
"Bundle 'vim-ruby/vim-ruby'


" Language
" 提供 markdown 着色功能，顺便也提供了 snippet
Bundle 'hallison/vim-markdown'
" mustache 支持
Bundle 'juvenn/mustache.vim'
" 提供 JSON 的语法高亮
Bundle 'JSON.vim'
" coffeeScript 支持
Bundle 'kchmck/vim-coffee-script'
" Stylus 支持
Bundle 'wavded/vim-stylus'
" Jade 高亮
Bundle 'digitaltoad/vim-jade'
" nginx 语法高亮
Bundle 'nginx.vim'
" Jinja 语法
Bundle 'Jinja'
" Mako 语法
Bundle 'mako.vim'


" Front
" zencoding
Bundle 'ZenCoding.vim'
" 美化js代码，并不是简单的缩进，而是整个优化
Bundle 'jsbeautify'
" 在 CSS 文件中实时显示色彩，如 #eaeaea，或者 red
if !g:isTerminal
  Bundle 'css_color.vim'
endi
" 高亮对应的 HTML 标签
Bundle 'gregsexton/MatchTag'
" 按 % 可以跳转到对应的标点或标签
Bundle 'matchit.zip'
" csslint 的 Vim 插件
Bundle 'bolasblack/csslint.vim'
" brunch 约定的文件组织方式的支持
Bundle 'drichard/vim-brunch'

"" non github repos
"" 快速的文件导航，可以在要打开文件或者在如入路径的时候按 command-t 试试看
"" 但是和 CtrlP.vim 重复了，所以干掉
""Bundle 'git://git.wincent.com/command-t.git'
