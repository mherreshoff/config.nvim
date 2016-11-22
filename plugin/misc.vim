" Dirvish ---------------------------------------------------------------------
function! s:SetupDirvish()
  " Hide dot-files by default
  call ToggleDotfiles()

  " Map gh to toggle showing hidden files
  nnoremap <buffer> gh :call ToggleDotfiles()<CR>

  " Add tab mappings
  nnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
  xnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>

  lcd %
endfun

function! ToggleDotfiles()
    if &filetype != 'dirvish' | return | endif

    let l:line = line('.')

    " Store dotfiles in b:dotfiles and remove
    if !exists('b:dotfiles')
        let l:h = @h
        let @h = ''
        silent! g@\v/\.[^\/]+/?$@y H
        silent! g//d _
        let b:dotfiles = split(@h, '\n')
        let @h = l:h
        execute ':' . string(max([0, l:line - len(b:dotfiles)]))
    " Re-add b:dotfiles to the top
    else
        call append(0, b:dotfiles)
        execute ':' . (l:line + len(b:dotfiles))
        unlet b:dotfiles
    endif
endfunction

augroup custom_dirvish
    autocmd!
    autocmd FileType dirvish call s:SetupDirvish()
aug END
" -----------------------------------------------------------------------------

" View handling----------------------------------------------------------------
if !exists("g:skipview_files")
    let g:skipview_files = []
endif

function! MakeViewCheck()
    if &l:diff | return 0 | endif
    if &buftype != '' | return 0 | endif
    if expand('%') =~ '\[.*\]' | return 0 | endif
    if empty(glob(expand('%:p'))) | return 0 | endif
    if &modifiable == 0 | return 0 | endif
    if len($TEMP) && expand('%:p:h') == $TEMP | return 0 | endif
    if len($TMP) && expand('%:p:h') == $TMP | return 0 | endif

    let file_name = expand('%:p')
    for ifiles in g:skipview_files
        if file_name =~ ifiles
            return 0
        endif
    endfor

    return 1
endfunction

augroup AutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePre,BufWinLeave ?* if MakeViewCheck() | silent! mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent! loadview | endif
augroup END
" Custom nav ------------------------------------------------------------------
function! EditAndGo(place)
  execute 'edit' a:place
  if isdirectory(a:place)
    lcd %
  else
    lcd %:h
  endif
endfunction

noremap <leader>gh :call EditAndGo('~/')<CR>
noremap <leader>gd :call EditAndGo('~/Downloads/')<CR>
noremap <leader>gx :call EditAndGo('~/Dropbox/')<CR>
noremap <leader>gi :call EditAndGo('~/.config/nvim/init.vim')<CR>
noremap <leader>gv :call EditAndGo('~/.config/nvim/')<CR>
noremap <leader>gj :call EditAndGo('~/Accomplishments.md')<CR>
execute 'noremap <leader>g? :echomsg "[h]ome . [d]ownloads . dropbo[x] . [i]nit.vim . nvim [c]onfig dir . [j]ournal"<CR>'
" -----------------------------------------------------------------------------
