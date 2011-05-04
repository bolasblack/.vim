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

"单个文件编译 {{{
map <F5> :call Do_OneFileMake()<CR>
function! Do_OneFileMake()
  if expand("%:p:h")!=getcwd()
    echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
    return
  endif
  let sourcefileename=expand("%:t")
  if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
    echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
    return
  endif
  let deletedspacefilename=substitute(sourcefileename,' ','','g')
  if strlen(deletedspacefilename)!=strlen(sourcefileename)
    echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
    return
  endif
  if &filetype=="c"
    if g:iswindows==1
      set makeprg=gcc\ -o\ %<.exe\ %
    else
      set makeprg=gcc\ -o\ %<\ %
    endif
  elseif &filetype=="cpp"
    if g:iswindows==1
      set makeprg=g++\ -o\ %<.exe\ %
    else
      set makeprg=g++\ -o\ %<\ %
    endif
    "elseif &filetype=="cs"
    "set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
  endif
  if(g:iswindows==1)
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','.exe','g')
    let toexename=outfilename
  else
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','','g')
    let toexename=outfilename
  endif

  if filereadable(outfilename)
    if(g:iswindows==1)
      let outdeletedsuccess=delete(getcwd()."\\".outfilename)
    else
      let outdeletedsuccess=delete("./".outfilename)
    endif
    if(outdeletedsuccess!=0)
      set makeprg=make
      echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
      return
    endif
  endif
  execute "silent make"
  set makeprg=make

  execute "normal :"
  if filereadable(outfilename)
    if(g:iswindows==1)
      execute "!".toexename
    else
      execute "!./".toexename
    endif
  endif
  execute "copen"

endfunction

"进行make的设置
map <F6> :call Do_make()<CR>
map <c-F6> :silent make clean<CR>
function! Do_make()
  set makeprg=make
  execute "silent make"
  execute "copen"
endfunction
"}}}
