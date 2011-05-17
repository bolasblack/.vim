" t2t 后缀名支持
au BufNewFile,BufRead *.t2t set filetype=txt2tags

" JSON 后缀名支持
au BufRead,BufNewFile *.json set filetype=json 

" mustache 模版语言对 HTML 文件的支持
au BufNewFile,BufRead *.mhtml set filetype=mustache

" 对php后缀名文件实现通过字典补全
au FileType php call AddPHPFuncList()
function! AddPHPFuncList()
    set dictionary-=$VIM/vimfiles/ExtraVim/php_funclist.txt dictionary+=$VIM/vimfiles/ExtraVim/php_funclist.txt
    set complete-=k complete+=k
endfunction
