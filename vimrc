" ----------- environment [[[
let g:isMac=0
let g:isLinux=0
let g:isTerminal=0
let g:isWindows=0
let g:isCmd=0
let g:isVSCode=0
if !has('unix')
  let g:isWindows=1
  if !has('gui_running')
    let g:isCmd=1
  endif
else
  if !has('mac')
    let g:isLinux=1
  else
    let g:isMac=1
  endif
  if !has('gui_running')
    let g:isTerminal=1
  endif
endif
if exists('g:vscode')
  let g:isVSCode=1
endif
function! Env()
  echo 'isMac: '      . g:isMac
  echo 'isLinux: '    . g:isLinux
  echo 'isTerminal: ' . g:isTerminal
  echo 'isWndows: '   . g:isWindows
  echo 'isCmd: '      . g:isCmd
  echo 'isVSCode: '   . g:isVSCode
endfunction
" ]]]
" ----------- path variable setting [[[
if g:isWindows
  let $vim = $VIM.'/vimfiles'
else
  let $vim = $HOME.'/.vim'
endif
let $v = $vim.'/vimrc'
let $rc = $vim.'/vimrc'

function! Load(relativePath)
  exec 'source '.$vim.'/'.a:relativePath
endfunction
" ]]]
" ----------- load files [[[
call Load('conf/plugin-manager.vim')

call plug#begin($vim.'/bundle')
call Load('conf/common-plugins.vim')
if !g:isVSCode
  call Load('conf/vimonly-plugins.vim')
endif
call plug#end()

call Load('conf/common.vim')
if !g:isVSCode
  call Load('conf/vimonly.vim')
endif
" ]]]
