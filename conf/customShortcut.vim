"------------自定义快捷键---------------
" 定义了“<leader>e”快捷键，当输入“,e”时，会打开_vimrc进行编辑
map <silent> <leader>e :call EditVimrc()<CR>
function! EditVimrc()
	:e $VIM/_vimrc
endfunction

" ,t Temp调用
map	<silent> <leader>t :call EditTemp()<CR>
function! EditTemp()
	:e $VIM/vimfiles/TEMP.txt
endfunction

" ,g Todo调用
map <silent> <leader>g :call Todo()<CR>
function! Todo()
	:e $VIM/vimfiles/todo.txt
	set syntax=Todo
endfunction

" F12 呼出/隐藏 工具栏
map <silent> <F12> :call CallManu()<CR>
function! CallManu()
	if g:havemanu==1
		set go=
		let g:havemanu=0
	else
		set go=m
		let g:havemanu=1
	endif
endfunction

"sketch相关配置
map <silent> <F3> :call ToggleSketch()<CR>

"<F4>进行版权声明的设置 authorinfo 插件配置{{{
let g:vimrc_author='yicuan' 
let g:vimrc_email='bolasblack@gmail.com' 
let g:vimrc_homepage='http://plafer.tk' 
nmap <F4> :AuthorInfoDetect<CR> 
"}}}

" <F5>检查当前文件代码语法(php){{{
function! CheckSyntax()
 if &filetype!="php"
  echohl WarningMsg | echo "Fail to check syntax! Please select the right file!" | echohl None
  return
 endif
 if &filetype=="php"
  " Check php syntax
  setlocal makeprg=\"php\"\ -l\ -n\ -d\ html_errors=off
  " Set shellpipe
  setlocal shellpipe=>
  " Use error format for parsing PHP error output
  setlocal errorformat=%m\ in\ %f\ on\ line\ %l
 endif
 execute "silent make %"
 set makeprg=make
 execute "normal :"
 execute "copen"
endfunction
map <F5> :call CheckSyntax()<CR>
"}}}

" <F6>打开Mru
map <silent> <F6> :Mru<CR>

" 使用<F8>打开Taglist或者Tagbar
"map <silent> <F10> :TlistToggle<CR>
nmap <silent> <F4> :TagbarToggle<CR>

" F11判定/打开NERDtree
map <silent> <F11> :NERDTree<CR>
" map <silent> <F12> :NERDTreeClose<CR>

"tabpage mappings {{{
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
map <M-n> :tabnew<CR>
map <M-c> :tabclose<CR>
" }}}
