au BufNewFile,BufRead *.t2t set filetype=txt2tags " t2t 后缀名支持
au BufRead,BufNewFile *.json set filetype=json " JSON 后缀名支持
au BufNewFile,BufRead *.mhtml set filetype=mustache " mustache 模版语言对 HTML 文件的支持
au BufNewFile,BufRead *.todo set syntax=Todo " todo 后缀名支持

" 控制 fcitx 在离开插入模式时改变输入模式 已注释 {{{
"let g:input_toggle = 1
"function! Fcitx2en()
   "let s:input_status = system("fcitx-remote")
   "if s:input_status == 2
      "let g:input_toggle = 1
      "let l:a = system("fcitx-remote -c")
   "endif
"endfunction
"function! Fcitx2zh()
   "let s:input_status = system("fcitx-remote")
   "if s:input_status != 2 && g:input_toggle == 1
      "let l:a = system("fcitx-remote -o")
      "let g:input_toggle = 0
   "endif
"endfunction
"set timeoutlen=150
"autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()
"}}}

" markdown syntax settings
"augroup mkd
    "autocmd BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set ai formatoptions=tcroqn2 comments=n:>
    "autocmd BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set wrap nonumber
"augroup END

" gjsLint
" 文件在 ~/.vim/ftplugin/javascript/
" 由 jsLint http://www.vim.org/scripts/script.php?script_id=2729 修改而来
" 修改文件在 https://github.com/ktmud/vim-unix/raw/master/.vim/ftplugin/javascript/
" 作者文章：http://wiki.ktmud.com/tips/Vim.html

" 对php后缀名文件实现通过字典补全 已注释 {{{
"au FileType php call AddPHPFuncList()
"function! AddPHPFuncList()
    "set dictionary-=$VIM/vimfiles/ExtraVim/php_funclist.txt dictionary+=$VIM/vimfiles/ExtraVim/php_funclist.txt
    "set complete-=k complete+=k
"endfunction
"}}}
