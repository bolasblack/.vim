" 这里没有什么配置，配置代码在下列文件中

" 设置 $ 变量
if has("win32")
  let $vimfiles = $VIM.'/vimfiles/'
  let $v = $VIM.'/_vimrc'
else
  let $vimfiles = $HOME.'/.vim/'
  let $v = $HOME.'/.vimrc'
endif
let $conf = $vimfiles.'/conf/'
let $base = $conf.'/base.vim'
let $plugin = $vimfiles.'/plugins/'

" 载入插件
source $conf\pluginManager.vim
" 载入 base 设置
source $conf\base.vim
" 载入带帐号密码的插件配置
"source $conf\pluginConfSc.vim

":vim set fileencodeing=UTF-8
