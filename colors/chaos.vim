" Vim color file
" Maintainer:   c4605 <bolasblack@gmail.com>
" Last Modified: 2014-03-17 14:26
" Description: Modified from Lucius.vim
"
" GUI / 256 color terminal
"


set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name="chaos"



"  Base color
"  ----------
"  Normal           普通文本
hi Normal           guifg=#e0e0e0           guibg=#202020
hi Normal           ctermfg=253             ctermbg=235


"  Spelling
"  --------
"  word not recognized
"  SpellBad         拼写检查器不能识别的单词。它会和本来应该使用的高亮进行组合。
hi SpellBad         guisp=#ee0000                                   gui=undercurl
hi SpellBad                                 ctermbg=196             cterm=undercurl
"  word not capitalized
"  SpellCap         应该大写字母开头的单词。它会和本来应该使用的高亮进行组合。
hi SpellCap         guisp=#eeee00                                   gui=undercurl
hi SpellCap                                 ctermbg=226             cterm=undercurl
"  rare word
"  SpellRare        拼写检查器能识别但很少使用的单词。它会和本来应该使用的高亮进行组合。
hi SpellRare        guisp=#ffa500                                   gui=undercurl
hi SpellRare                                ctermbg=214             cterm=undercurl
"  wrong spelling for selected region
"  SpellLocal       拼写检查器能识别但只在其它区域使用的单词。它会和本来应该使用的高亮进行组合。
hi SpellLocal       guisp=#ffa500                                   gui=undercurl
hi SpellLocal                               ctermbg=214             cterm=undercurl


"  Cursor
"  ------
"  character under the cursor
"  Cursor           光标所在的字符
hi Cursor           guifg=bg                guibg=#a3e3ed
hi Cursor           ctermfg=bg              ctermbg=153
"  like cursor, but used when in IME mode
"  CursorIM         类似于 Cursor，但用于 IME 模式
hi CursorIM         guifg=bg                guibg=#96cdcd
hi CursorIM         ctermfg=bg              ctermbg=116
"  cursor column
"  CursorColumn     置位 'cursorcolumn' 时，光标所在的屏幕列
hi CursorColumn     guifg=NONE              guibg=#404448           gui=none
hi CursorColumn     ctermfg=NONE            ctermbg=236             cterm=none
"  cursor line/row
"  CursorLine       置位 'cursorline' 时，光标所在的屏幕行
hi CursorLine                               guibg=#404448           gui=none
hi CursorLine                               ctermbg=236             cterm=none


"  Misc
"  ----
"  directory names and other special names in listings
"  Directory        目录名 (还有列表里的其它特殊名字)
hi Directory        guifg=#c0e0b0                                   gui=none
hi Directory        ctermfg=151                                     cterm=none
"  error messages on the command line
"  ErrorMsg         命令行上的错误信息
hi ErrorMsg         guifg=#ee0000           guibg=NONE              gui=none
hi ErrorMsg         ctermfg=196             ctermbg=NONE            cterm=none
"  column separating vertically split windows
"  VertSplit        分离垂直分割窗口的列
hi VertSplit        guifg=#777777           guibg=#363946           gui=none
hi VertSplit        ctermfg=242             ctermbg=237             cterm=none
"  columns where signs are displayed (used in IDEs)
"  SignColumn       显示 |signs| 的列
hi SignColumn       guifg=#818698           guibg=#363946
hi SignColumn       ctermfg=245             ctermbg=237
"  line numbers
"  LineNr           ":number" 和 ":#" 命令与置位 'number' 或 'relativenumber' 选项时的行号。
hi LineNr           guifg=#818698           guibg=#363946
hi LineNr           ctermfg=245             ctermbg=237
"  cursor line numbers
"  CursorLineNr     和 LineNr 类似，置位 'cursorline' 或 'relativenumber' 时用于光标行。
hi CursorLineNr     guifg=#818698           guibg=#363946
hi CursorLineNr     ctermfg=255             ctermbg=237
"  match parenthesis, brackets
"  MatchParen       如果光标所在或刚刚在它之前的字符是配对的括号一部分的话，它和它的配对。|pi_paren.txt|
hi MatchParen       guifg=#00ff00           guibg=NONE              gui=bold
hi MatchParen       ctermfg=46              ctermbg=NONE            cterm=bold
"  the 'more' prompt when output takes more than one line
"  MoreMsg          |more-prompt|
hi MoreMsg          guifg=#2e8b57                                   gui=none
hi MoreMsg          ctermfg=29                                      cterm=none
"  text showing what mode you are in
"  ModeMsg          'showmode' 消息 (例如，"-- INSERT --")
hi ModeMsg          guifg=#76d5f8           guibg=NONE              gui=none
hi ModeMsg          ctermfg=117             ctermbg=NONE            cterm=none
"  the '~' and '@' and showbreak, '>' double wide char doesn't fit on line
"  NonText          窗口尾部的 '~' 和 '@'，'showbreak' 的字符和其它在文本里实际不存在的字符 (例如，代替行尾放不下的双宽字符而显示的 ">")。
hi NonText          guifg=#404040                                   gui=none
hi NonText          ctermfg=238                                     cterm=none
"  the hit-enter prompt (show more output) and yes/no questions
"  Question         |hit-enter| 提示和 yes/no 问题
hi Question         guifg=fg                                        gui=none
hi Question         ctermfg=fg                                      cterm=none
"  meta and special keys used with map, unprintable characters
"  SpecialKey       ":map" 列出的 Meta 和特殊键，也包括文本里不可显示字符的显示和'listchars'。一般的: 和实际内容显示上有差异的文本。
hi SpecialKey       guifg=#405060
hi SpecialKey       ctermfg=239
"  titles for output from :set all, :autocmd, etc
"  Title            ":set all"、":autocmd" 等输出的标题
hi Title            guifg=#62bdde                                   gui=none
hi Title            ctermfg=74                                      cterm=none
" hi Title            guifg=#5ec8e5                                   gui=none
"  warning messages
"  WarningMsg       警告消息
hi WarningMsg       guifg=#e5786d                                   gui=none
hi WarningMsg       ctermfg=173                                     cterm=none
"  current match in the wildmenu completion
"  WildMenu         'wildmenu' 补全的当前匹配
hi WildMenu         guifg=#cae682           guibg=#363946           gui=bold,underline
hi WildMenu         ctermfg=16              ctermbg=186             cterm=bold


"  Diff
"  ----
"  added line
"  DiffAdd          diff 模式: 增加的行 |diff.txt|
hi DiffAdd          guifg=#80a090           guibg=#313c36           gui=none
hi DiffAdd          ctermfg=fg             ctermbg=22              cterm=none
"  changed line
"  DiffChange       diff 模式: 改变的行 |diff.txt|
hi DiffChange       guifg=NONE              guibg=#4a343a           gui=none
hi DiffChange       ctermfg=fg              ctermbg=52              cterm=none
"  deleted line
"  DiffDelete       diff 模式: 删除的行 |diff.txt|
hi DiffDelete       guifg=#6c6661           guibg=#3c3631           gui=none
hi DiffDelete       ctermfg=fg              ctermbg=58              cterm=none
"  changed text within line
"  DiffText         diff 模式: 改变行里的改动文本 |diff.txt|
hi DiffText         guifg=#f05060           guibg=#4a343a           gui=bold
hi DiffText         ctermfg=203             ctermbg=52             cterm=bold


"  Folds
"  -----
"  line used for closed folds
"  Folded           用于关闭的折叠的行
" hi Folded           guifg=#91d6f8           guibg=#363946           gui=none
" hi Folded           ctermfg=117             ctermbg=238             cterm=none
hi Folded           guifg=#d0e0f0           guibg=#363946           gui=none
hi Folded           ctermfg=117             ctermbg=237             cterm=none
"  column on side used to indicated open and closed folds
"  FoldColumn       'foldcolumn'
hi FoldColumn       guifg=#91d6f8           guibg=#363946           gui=none
hi FoldColumn       guifg=#c0c0d0           guibg=#363946           gui=none
hi FoldColumn       ctermfg=117             ctermbg=238             cterm=none


"  Search
"  ------
"  highlight incremental search text; also highlight text replaced with :s///c
"  IncSearch        'incsearch' 高亮；也用于被 ":s///c" 替换的文本
hi IncSearch        guifg=#66ffff                                   gui=reverse
hi IncSearch        ctermfg=87                                      cterm=reverse
"  hlsearch (last search pattern), also used for quickfix
"  Search           最近搜索模式的高亮 (见 'hlsearch')。也用于 quickfix 当前行的高亮和其它类似的要突出显示的项目。
hi Search                                    guibg=#ffaa33          gui=none
hi Search                                    ctermbg=214            cterm=none


"  Popup Menu
"  ----------
"  normal item in popup
"  Pmenu            弹出菜单: 普通项目。
hi Pmenu            guifg=#e0e0e0           guibg=#303840           gui=none
hi Pmenu            ctermfg=253             ctermbg=233             cterm=none
"  selected item in popup
"  PmenuSel         弹出菜单: 选中项目。
hi PmenuSel         guifg=#cae682           guibg=#505860           gui=none
hi PmenuSel         ctermfg=186             ctermbg=237             cterm=none
"  scrollbar in popup
"  PmenuSbar        弹出菜单: 滚动条。
hi PMenuSbar                                guibg=#505860           gui=none
hi PMenuSbar                                ctermbg=59              cterm=none
"  thumb of the scrollbar in the popup
"  PmenuThumb       弹出菜单: 滚动条的拇指 (thumb)。
hi PMenuThumb                               guibg=#808890           gui=none
hi PMenuThumb                               ctermbg=102             cterm=none


"  Status Line
"  -----------
"  status line for current window
"  StatusLine       当前窗口的状态行*hl-StatusLineNC*
hi StatusLine       guifg=#e0e0e0           guibg=#363946           gui=bold
hi StatusLine       ctermfg=254             ctermbg=237             cterm=bold
"  status line for non-current windows
"  StatusLineNC     非当前窗口的状态行，注意: 如果等于 "StatusLine"，Vim 会使用 "^^^" 指示当前窗口的状态行。
hi StatusLineNC     guifg=#767986           guibg=#363946           gui=none
hi StatusLineNC     ctermfg=244             ctermbg=237             cterm=none


"  Tab Lines
"  ---------
"  tab pages line, not active tab page label
"  TabLine          标签页行，非活动标签页标签
hi TabLine          guifg=#b6bf98           guibg=#363946           gui=none
hi TabLine          ctermfg=244             ctermbg=236             cterm=none
"  tab pages line, where there are no labels
"  TabLineFill      标签页行，没有标签的地方
hi TabLineFill      guifg=#cfcfaf           guibg=#363946           gui=none
hi TabLineFill      ctermfg=187             ctermbg=236             cterm=none
"  tab pages line, active tab page label
"  TabLineSel       标签页行，活动标签页标签
hi TabLineSel       guifg=#efefef           guibg=#414658           gui=bold
hi TabLineSel       ctermfg=254             ctermbg=236             cterm=bold


"  Visual
"  ------
"  visual mode selection
"  Visual           可视模式的选择区
hi Visual           guifg=NONE              guibg=#364458
hi Visual           ctermfg=NONE            ctermbg=24
"  visual mode selection when vim is not owning the selection (x11 only)
"  VisualNOS        Vim 是 "选择区的非拥有者" 时，可视模式的选择区。只有 X11 GUI 的 |gui-x11| 和 |xterm-clipboard| 才提供此支持。
hi VisualNOS        guifg=fg                                        gui=underline
hi VisualNOS        ctermfg=fg                                      cterm=underline



"  语法高亮组
"  -------------


"  Comment Group
"  -------------
"  any comment
hi Comment          guifg=#606060                                   gui=none
hi Comment          ctermfg=240                                     cterm=none


"  Constant Group
"  --------------
"  any constant
hi Constant         guifg=#8cd0d3                                   gui=none
hi Constant         ctermfg=116                                     cterm=none
"  strings
hi String           guifg=#80c0d9                                   gui=none
hi String           ctermfg=110                                     cterm=none
"  character constant
hi Character        guifg=#80c0d9                                   gui=none
hi Character        ctermfg=110                                     cterm=none
"  numbers decimal/hex
hi Number           guifg=#8cd0d3                                   gui=none
hi Number           ctermfg=116                                     cterm=none
"  true, false
hi Boolean          guifg=#8cd0d3                                   gui=none
hi Boolean          ctermfg=116                                     cterm=none
"  float
hi Float            guifg=#8cd0d3                                   gui=none
hi Float            ctermfg=116                                     cterm=none


"  Identifier Group
"  ----------------
"  any variable name
hi Identifier       guifg=#e6c080                                   gui=none
hi Identifier       ctermfg=180                                     cterm=none
"  function, method, class
hi Function         guifg=#e6c080                                   gui=none
hi Function         ctermfg=180                                     cterm=none


"  Statement Group
"  ---------------
"  any statement
hi Statement        guifg=#b3d38c                                   gui=none
hi Statement        ctermfg=150                                     cterm=none
"  if, then, else
hi Conditional      guifg=#b3d38c                                   gui=none
hi Conditional      ctermfg=150                                     cterm=none
"  try, catch, throw, raise
hi Exception        guifg=#b3d38c                                   gui=none
hi Exception        ctermfg=150                                     cterm=none
"  for, while, do
hi Repeat           guifg=#b3d38c                                   gui=none
hi Repeat           ctermfg=150                                     cterm=none
"  case, default
hi Label            guifg=#b3d38c                                   gui=none
hi Label            ctermfg=150                                     cterm=none
"  sizeof, +, *
hi Operator         guifg=#b3d38c                                   gui=none
hi Operator         ctermfg=150                                     cterm=none
"  any other keyword
hi Keyword          guifg=#b3d38c                                   gui=none
hi Keyword          ctermfg=150                                     cterm=none


"  Preprocessor Group
"  ------------------
"  generic preprocessor
hi PreProc          guifg=#e9dfaf                                   gui=none
hi PreProc          ctermfg=187                                     cterm=none
"  #include
hi Include          guifg=#e9dfaf                                   gui=none
hi Include          ctermfg=187                                     cterm=none
"  #define
hi Define           guifg=#e9dfaf                                   gui=none
hi Define           ctermfg=187                                     cterm=none
"  same as define
hi Macro            guifg=#e9dfaf                                   gui=none
hi Macro            ctermfg=187                                     cterm=none
"  #if, #else, #endif
hi PreCondit        guifg=#e9dfaf                                   gui=none
hi PreCondit        ctermfg=187                                     cterm=none


"  Type Group
"  ----------
"  int, long, char
hi Type             guifg=#93d6a9                                   gui=none
hi Type             ctermfg=115                                     cterm=none
"  static, register, volative
hi StorageClass     guifg=#93d6a9                                   gui=none
hi StorageClass     ctermfg=115                                     cterm=none
"  struct, union, enum
hi Structure        guifg=#93d6a9                                   gui=none
hi Structure        ctermfg=115                                     cterm=none
"  typedef
hi Typedef          guifg=#93d6a9                                   gui=none
hi Typedef          ctermfg=115                                     cterm=none


"  Special Group
"  -------------
"  any special symbol
hi Special          guifg=#cca3b3                                   gui=none
hi Special          ctermfg=181                                     cterm=none
"  special character in a constant
hi SpecialChar      guifg=#cca3b3                                   gui=none
hi SpecialChar      ctermfg=181                                     cterm=none
"  things you can CTRL-]
hi Tag              guifg=#cca3b3                                   gui=none
hi Tag              ctermfg=181                                     cterm=none
"  character that needs attention
hi Delimiter        guifg=#cca3b3                                   gui=none
hi Delimiter        ctermfg=181                                     cterm=none
"  special things inside a comment
hi SpecialComment   guifg=#cca3b3                                   gui=none
hi SpecialComment   ctermfg=181                                     cterm=none
"  debugging statements
hi Debug            guifg=#cca3b3           guibg=NONE              gui=none
hi Debug            ctermfg=181             ctermbg=NONE            cterm=none


"  Underlined Group
"  ----------------
"  text that stands out, html links
hi Underlined       guifg=fg                                        gui=underline
hi Underlined       ctermfg=fg                                      cterm=underline


"  Ignore Group
"  ------------
"  left blank, hidden
hi Ignore           guifg=bg
hi Ignore           ctermfg=bg


"  Error Group
"  -----------
"  any erroneous construct
hi Error            guifg=#e37170           guibg=#432323           gui=none
hi Error            ctermfg=167             ctermbg=52            cterm=none


"  Todo Group
"  ----------
"  todo, fixme, note, xxx
hi Todo             guifg=#efef8f           guibg=NONE              gui=underline
hi Todo             ctermfg=228             ctermbg=NONE            cterm=underline



"  插件高亮
"  -------------


"  GitGutter
"  ------
hi GitGutterAdd     guifg=#009900           guibg=#363946
hi GitGutterAdd     ctermfg=2               ctermbg=237
hi GitGutterChange  guifg=#bbbb00           guibg=#363946
hi GitGutterChange  ctermfg=3               ctermbg=237
hi GitGutterDelete  guifg=#ff2222           guibg=#363946
hi GitGutterDelete  ctermfg=1               ctermbg=237
hi link GitGutterChangeDelete GitGutterChange

