" base
" 快速查找的工具，可以配合 Neobundle 查找插件，十分好用
Plug 'Shougo/unite.vim'
" vim shell
Plug 'Shougo/vimshell.vim'
" 给vim增加url的识别功能，当然功能远远不止这些
Plug 'vim-scripts/utl.vim'
" 在默认启动界面显示最近打开过的文件等
Plug 'mhinz/vim-startify'
" 提供命令模式和高亮模式下的补全，通过 C-n | C-p 补全缓冲区中出现过的单词
Plug 'vim-scripts/CmdlineComplete'
" 高亮对应的标点，如 [] {}
Plug 'vim-scripts/matchparenpp'
" 目录树
Plug 'scrooloose/nerdtree'
" 多国语翻译为指定语言的插件
Plug 'bolasblack/gtrans.vim'
" vim 中文文档
"Plug 'bolasblack/vimcdoc'
" 漂亮的 mode line
" Monaco for Powerline  https://gist.github.com/baopham/1838072
" Powerline fonts       https://github.com/Lokaltog/powerline-fonts
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 为某个区域的内容设置高亮
Plug 'vim-scripts/SyntaxRange'
" 打开文件时自动检测文件编码，似乎在 Mac 下会出现问题，检测编码出错
"if !g:isMac
  "Plug 'FencView.vim'
"endif

" quick edit
" 强大的自动补全
Plug 'Shougo/neocomplete'
" 代码片段引擎
Plug 'Shougo/neosnippet'
" 代码片段模板
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
" 加强版的 fFtT
Plug 'rhysd/clever-f.vim'
" 仿 Sublime Text 风格的全局搜索工具，使用 ack 或者 ag
Plug 'dyng/ctrlsf.vim'
" 比 dwn 更可配置的的平铺窗口管理
Plug 'zhaocai/GoldenView.Vim'
" 快速找到、打开文件
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
" 用于快速的打开文件和跳转 Buffer
Plug 'kien/ctrlp.vim'
" CtrlP 用于快速打开本项目文件，FuzzyFinder用于打开其他文件

" CtrlP Extensions
" a ctrlp.vim extension - Navigate and jump to function defs
Plug 'tacahiroy/ctrlp-funky'


" coding
" 代码浏览工具，似乎更适合 C
" *依赖 Vim 插件 TxtBrowser *
"Plug 'taglist.vim'
" 文本浏览工具，不过最近的版本会导致无法查阅 Vim 的帮助文档，所以不再使用
"Plug 'TxtBrowser'
" 代码浏览工具
Plug 'majutsushi/tagbar'
" 在 Vim 里快捷的使用 Git
Plug 'tpope/vim-fugitive'
" 在 Vim 中显示当前编辑文件在版本控制工具中的状态
Plug 'airblade/vim-gitgutter'
" 多语言语法检查
Plug 'scrooloose/syntastic', { 'do' : 'npm install jsonlint csslint -g' }
" 缩进辅助线
Plug 'Yggdroot/indentLine'


" Fun
"Plug 'edkolev/tmuxline.vim'


" Python
" 更好的 Python 语法高亮
"Plug 'python.vim--Vasiliev'


" Language
" 提供 markdown 着色功能
Plug 'tpope/vim-markdown'
" mustache 支持
Plug 'juvenn/mustache.vim'
" 提供 JSON 的语法高亮
Plug 'vim-scripts/JSON.vim'
" coffeeScript 支持
Plug 'kchmck/vim-coffee-script'
" Stylus 支持
Plug 'wavded/vim-stylus'
" Jade 高亮
Plug 'digitaltoad/vim-jade'
" Less css 高亮
Plug 'groenewege/vim-less'
" nginx 语法高亮
Plug 'vim-scripts/nginx.vim'
" Jinja 语法
Plug 'vim-scripts/Jinja'
" Mako 语法
Plug 'vim-scripts/mako.vim'


" Front
" 在 CSS 文件中实时显示色彩，如 #eaeaea，或者 red
"if !g:isTerminal
"  Plug 'css_color.vim'
"endi
" 高亮对应的 HTML 标签
"Plug 'gregsexton/MatchTag'

"" non github repos
"" 快速的文件导航，可以在要打开文件或者在如入路径的时候按 command-t 试试看
"" 但是和 CtrlP.vim 重复了，所以干掉，这里只是做一个示例
""Plug 'git://git.wincent.com/command-t.git'
