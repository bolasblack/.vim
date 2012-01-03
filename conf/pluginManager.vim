"----------- Plugin Manager Config -----------
" 启用 Pathhogen
call pathogen#infect('plugins')
" 刷新 bundle/ 里的插件的 helptags
"call pathogen#helptags()

" let Vundle manage Vundle
call vundle#rc()

" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"

" vim-scripts repos
" FuzzyFinder 必须的库
Bundle 'L9'
" 快速的找到、打开文件
Bundle 'FuzzyFinder' 
"列出当前打开的 buffer
"Bundle 'bufexplorer.zip'
"给vim增加url的识别功能，当然功能远远不止这些
Bundle 'utl.vim'
"可以添加目录和文件到收藏夹
"Bundle 'FavEx'
"自动添加作者信息
Bundle 'AuthorInfo'
"快速给单词/句子两边增加符号（包括html标签），缺点是不用用"."来重复命令，repeat.vim可以解决这个问题
"Bundle 'surround.vim'
Bundle 'repeat.vim'
"提供命令模式下的补全，可以补全缓冲区中出现过的单词，很好用
Bundle 'CmdlineComplete'
"也是用于管理插件
Bundle 'pathogen.vim'
"Python 纠错
"Bundle 'pyflakes.vim'
"代码浏览工具，似乎更适合 C ，TxtBrowser 依赖
"Bundle 'taglist.vim'
"文本浏览工具，不过最近的版本会导致无法查阅 Vim 的帮助文档，所以不再使用
"Bundle 'TxtBrowser'

"zencoding
Bundle 'ZenCoding.vim'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"自动闭合标点
Bundle 'AutoClose'
"保存文件时自动创建文件夹
Bundle 'auto_mkdir'
"写 Doxygen 风格注释
Bundle 'DoxygenToolkit.vim'
"打开文件时自动检测文件编码
Bundle 'FencView.vim'
"优化js代码，并不是简单的缩进，而是整个优化
"Bundle 'jsbeautify'
"按 % 可以跳转到对应的标点或标签
Bundle 'matchit.zip'
"列出最近打开的文件
"Bundle 'MRU'
"一个 quicklist 来显示标注有 TODO: 的行
Bundle 'TaskList.vim'
"提供python的语法缩进，比默认的要好很多(vimer.cn修改)
Bundle 'indentpython.vim--nianyang'
"Matrix 风格的 Vim 屏保
Bundle 'matrix.vim--Yang'
"高亮对应的标点，如 [] {}
Bundle 'matchparenpp'
"为编写 Python 代码作的一些快捷键，比如选择一个代码块等
Bundle 'python.vim'
"更好的 Python 语法高亮
Bundle 'python.vim--Vasiliev'
"提供 JSON 的语法高亮
Bundle 'JSON.vim'
"在 CSS 文件中实时显示色彩，如 #eaeaea，或者 red
Bundle 'css_color.vim'
"

" original repos on github
"强大的自动补全
Bundle 'Shougo/neocomplcache'
" supertab
Bundle 'ervandew/supertab'
"代码片段引擎
"Bundle 'drmingdrmer/xptemplate'
Bundle 'msanders/snipmate.vim'
"在 Vim 里快捷的使用 Git
Bundle 'tpope/vim-fugitive'
"快速移动光标到指定位置
Bundle 'Lokaltog/vim-easymotion'
"提供markdown着色功能，顺便也提供了snippet
Bundle 'hallison/vim-markdown'
"LESS 文件语法高亮
Bundle 'groenewege/vim-less'
"代码浏览工具，更适合 OO 语言
Bundle 'majutsushi/tagbar'
"标点对齐
Bundle 'godlygeek/tabular'
"目录树
Bundle 'scrooloose/nerdtree'
"代码注释工具
Bundle 'scrooloose/nerdcommenter'
"在 Vim 中运行 Shell，vim-script 备份的那个没有Python的文件
Bundle 'rson/vim-conque'
" 基于 PEP8 的 Python 代码风格检查插件
Bundle 'jbking/vim-pep8'
" 高亮对应的 HTML 标签
Bundle 'gregsexton/MatchTag'
" csslint 的 Vim 插件
Bundle 'bolasblack/csslint.vim'
" 多国语翻译为指定语言的插件
Bundle 'bolasblack/gtrans.vim'
" mustache 支持
Bundle 'juvenn/mustache.vim'
"coffeeScript 支持
Bundle 'kchmck/vim-coffee-script'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
