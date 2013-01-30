" 这里没有什么配置，配置代码在下列文件中

" 设置 $ 变量
if has("win32")
  let $vim = $VIM.'/vimfiles/'
else
  let $vim = $HOME.'/.vim/'
endif
let $v = $vim.'/.vimrc'
let $conf = $vim.'/conf/'
let $base = $conf.'/base.vim'
let $plugin = $conf.'/pluginManager.vim'

" 载入 base 设置
source $base
" 载入插件
source $plugin
" 载入带帐号密码的插件配置
"source $conf\pluginConfSc.vim

":vim set fileencoding=UTF-8
