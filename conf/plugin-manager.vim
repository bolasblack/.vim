let g:vimPlugPath = $vim.'/.vim-plug'
let g:vimPlugFile = g:vimPlugPath.'/autoload/plug.vim'

" Install vim-plug if not found
if empty(glob(g:vimPlugFile))
  execute 'silent !echo curl -fLo "'.g:vimPlugFile.'" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Required
exe "set runtimepath+=".g:vimPlugPath

" from https://github.com/junegunn/vim-plug/wiki/tips#conditional-activation
function! PlugCond(cond, ...) " [[[
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction " ]]]
