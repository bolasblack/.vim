" 这里没有什么配置，配置代码在下列文件中

" 设置 $ 变量
if has("win32")
  let $VIMFILES = $VIM.'/vimfiles/'
  let $V = $VIM.'/_vimrc'
else
  let $VIMFILES = $HOME.'/.vim/'
  let $V = $HOME.'/.vimrc'
endif
let $conf = $VIMFILES.'/conf/'
let $base = $conf.'/base.vim'
let $PLUGIN = $VIMFILES.'/Plugin/'

" 载入插件
source $conf\pluginManager.vim
" 载入 base 设置
source $conf\base.vim
" 载入带帐号密码的插件配置
source $conf\pluginConfSc.vim
