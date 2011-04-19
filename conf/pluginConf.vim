"------------ 一般插件配置 ---------------
" Taglist 配置 {{{
"TlistUpdate可以更新tags
map <F3> :silent! Tlist<CR> "按下F3就可以呼出了
"let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=0 "不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0
" 这项必须设定，否则出错,配置taglist的ctags路径，不过也可以把ctags路径添
" 加进系统变量 path 里，就不用设置了
"let Tlist_Ctags_Cmd = '~/ctags.exe'
" 设置tags文件的寻找路径
"set tags += tags;
" }}}

" TxtBrowser 设置 {{{
au BufEnter *.txt setlocal ft=txt
" let g:default_web_browser=chrome
" }}}

" Zen Coding 配置 {{{
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
" }}}

" Netrw 设置 {{{
let g:netrw_winsize = 30
"输入',fe'时，就会打开一个垂直分隔的窗口浏览当前文件所在的目录，窗口的宽度为30
nmap <silent> <leader>ntf :Sexplore!<cr> 
"}}}

"vimwiki {{{
let g:vimwiki_list = [{'path': '$VIM/vimwiki/', 
			\'path_html': '$VIM/vimwiki/html/',
			\'html_header':'$VIM/vimwiki/kwiki_tpl/header.htm',
			\'html_footer':'$VIM/vimwiki/kwiki_tpl/footer.htm'},
			\{'path':'X:\demo\wiki'}]
" 是否在词条文件保存时就输出html  这个会让保存大词条比较慢
" 所以我默认没有启用  有需要的话就把这一行复制到下面去
"     \ 'auto_export': 1,
 
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0
 
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
 
" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
" let g:vimwiki_menu = ''
 
" 是否开启按语法折叠  会让文件比较慢
"let g:vimwiki_folding = 1
 
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
 
" Wiki 中可用的 HTML 标签
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
"}}}
