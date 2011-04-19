" 这里没有什么配置，配置代码在下列文件中

" 设置 $ 变量
if has("win32")
  let $VIMFILES = $VIM.'/vimfiles/'
  let $V = $VIM.'/_vimrc'
else
  let $VIMFILES = $HOME.'/.vim/'
  let $V = $HOME.'/.vimrc'
endif
let $CONF = $VIMFILES.'/conf/'
let $PLUGIN = $VIMFILES.'/Plugin/'

" 载入 base 设置
source $CONF\base.vim
" 载入自定义功能
source $CONF\customFeture.vim
" 载入自定义快捷键
source $CONF\customShortcut.vim
" 载入一般插件配置
source $CONF\pluginConf.vim
" 载入带帐号密码的插件配置
source $CONF\pluginConfSc.vim

"------------其他---------------{{{
set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"}}}
