let s:tquit = '<C-\><C-n>'
let s:iquit = '<ESC>'

function! util#bind(key, val, modes) abort
  for l:m in a:modes
    if l:m == 't'
      let l:cmd = s:tquit.a:val
    elseif l:m == 'i'
      let l:cmd = s:iquit.a:val
    else
      let l:cmd = a:val
    endif
    exec l:m.'noremap <silent> '.a:key." ".l:cmd
  endfor
endfunction
