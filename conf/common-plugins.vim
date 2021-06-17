" base
" 自动添加作者信息
Plug 'vim-scripts/AuthorInfo'
" 快速给单词/句子两边增加符号（包括html标签），缺点是不用用'.'来重复命令，repeat.vim可以解决这个问题
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Undo tree
Plug 'vim-scripts/Gundo'
" 按 % 可以跳转到对应的标点或标签
Plug 'vim-scripts/matchit.zip'
" 标点对齐
Plug 'godlygeek/tabular'
" vim 中文文档
"Plug 'bolasblack/vimcdoc'
" 自动闭合标点
Plug 'Raimondi/delimitMate'
" 在 Vim 中使用 sudo
Plug 'vim-scripts/sudo.vim'

" 快速移动光标到指定位置
Plug 'easymotion/vim-easymotion', PlugCond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', PlugCond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
" automatically search for & insert URL targets for links in Markdown & ReST
Plug 'sampsyo/autolink.vim'
" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'


" coding
" 写 Doxygen 风格注释
Plug 'vim-scripts/DoxygenToolkit.vim'
" 代码注释工具
Plug 'tomtom/tcomment_vim'
" 一个 quicklist 来显示标注有 TODO: 的行
Plug 'vim-scripts/TaskList.vim'
" Gist 支持
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
" EditorConfig
Plug 'editorconfig/editorconfig-vim'
" 自动去除行末空格
Plug 'bronson/vim-trailing-whitespace'


" Python
" 提供 python 的语法缩进，比默认的要好很多(vimer.cn修改)
"Plug 'indentpython.vim--nianyang'
" 为编写 Python 代码作的一些快捷键，比如选择一个代码块等
"Plug 'python.vim'


" Ruby
" rails 支持
"Plug 'tpope/vim-rails'
" 自动输入 end
"Plug 'tpope/vim-endwise'
" ruby 支持
"Plug 'vim-ruby/vim-ruby'


" Front
" zencoding
"Plug 'mattn/emmet-vim'
" 美化js代码，并不是简单的缩进，而是整个优化
"Plug 'jsbeautify'
