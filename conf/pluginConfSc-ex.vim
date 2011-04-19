"--------- 带帐号密码的插件配置 ------------
" VimRepress 设置 {{{
let VIMPRESS=[{'username':'', 
               \'password':'', 
               \'blog_url':'http://plafer.tk/' 
               \}]
"}}}

" dokuVimki {{{
" user name with which you want to login at the remote wiki(登录dokuwiki的用户名)
let g:DokuVimKi_USER = ''
 
" password (登录密码)
let g:DokuVimKi_PASS = ''
 
" url of the remote wiki (without trailing '/') 远程wiki的地址(不需要最后的"/")
let g:DokuVimKi_URL  = 'http://plafer.tk/wiki'
 
" 是否在打开vim的时候连接远程wiki
let g:DokuVimKi_AUTOCONNECT = 'no'
 
" width of the index window (optional, defaults to 30) dokuwiki页面树显示宽度
let g:DokuVimKi_INDEX_WINWIDTH = 40
 
" set a default summary for :w (optional, defaults to [xmlrpc dokuvimki edit]) 页面树窗口中文件列的宽度
let g:DokuVimKi_DEFAULT_SUM = 'fancy default summary'
"}}}
