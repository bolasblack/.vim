" t2t 后缀名支持
au BufNewFile,BufRead *.t2t set filetype=txt2tags

" JSON 后缀名支持
au BufRead,BufNewFile *.json set filetype=json 

" mustache 模版语言对 HTML 文件的支持
au BufNewFile,BufRead *.mhtml set filetype=mustache

" todo 后缀名支持
au BufNewFile,BufRead *.todo set syntax=Todo

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

" 对php后缀名文件实现通过字典补全
au FileType php call AddPHPFuncList()
function! AddPHPFuncList()
    set dictionary-=$VIM/vimfiles/ExtraVim/php_funclist.txt dictionary+=$VIM/vimfiles/ExtraVim/php_funclist.txt
    set complete-=k complete+=k
endfunction
