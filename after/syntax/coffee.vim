" Language:    CoffeeScript
" License:     WTFPL

"/////////////////////////////////////////////////////////////////////////////
" syntax defines
"/////////////////////////////////////////////////////////////////////////////

if !exists('g:todo_keyword')
  let g:todo_keyword = ["TODO", "FIX", "FIXME"]
endif
if !exists('g:warning_keyword')
  let g:warning_keyword = ["WARNING"]
endif

silent exec ':syn keyword coffeeTodo contained ' . join(g:todo_keyword, " ")

silent exec ':syn keyword coffeeWarmming contained ' . join(g:warning_keyword, " ")
hi def link coffeeWarmming Error

syn match coffeeComment /#.*/ contains=coffeeTodo,coffeeWarmming,@Spell
syn region coffeeBlockComment start=/####\@!/ end=/###/ contains=coffeeTodo,coffeeWarmming,@Spell

"/////////////////////////////////////////////////////////////////////////////
" finish
"/////////////////////////////////////////////////////////////////////////////

let b:current_syntax = "coffee"

