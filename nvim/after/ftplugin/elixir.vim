setlocal colorcolumn=120
setlocal synmaxcol=120

function! ElixirFoldText()
  let fold_size = (v:foldend - v:foldstart)
  return getline(v:foldstart).' ('.fold_size.' lines)'
endfunction
setlocal foldtext=ElixirFoldText()

" function! ElixirFolds()
"   let tabstop = &tabstop
"   let line = getline(v:lnum)
"   let indent = indent(v:lnum)
"   let level = (indent / tabstop) + 1
"
"   if match(line, '@doc') >= 0
"     return '>'.level
"   elseif match(line, 'def') >= 0
"     return '>'.level
"   elseif match(line, 'defmodule') >= 0
"     return '>'.level
"   elseif match(line, 'defp') >= 0
"     return '>'.level
"   else
"     return "="
"   end
" endfunction
" setlocal foldexpr=ElixirFolds()

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }

" Mix format elixir files on save.
let g:mix_format_on_save = 1
