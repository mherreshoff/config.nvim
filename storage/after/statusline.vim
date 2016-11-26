" Should be in 'after', as it may depend upon other plugins.

" Always show the status line.
set laststatus=2
set statusline=

function! g:StatuslineLintErr()
  if !exists('g:loaded_ale')
    return ''
  endif
  let l:buffer = bufnr('%')
  let [l:err, l:warn] = ale#statusline#Count(l:buffer)
  if l:err > 0 && l:warn == 0
    return printf('[%sE]', l:err)
  elseif l:err > 0
    return printf('%sE]', l:err)
  endif
  return ''
endfunction

function! g:StatuslineLintWarn()
  if !exists('g:loaded_ale')
    return ''
  endif
  let l:buffer = bufnr('%')
  let [l:err, l:warn] = ale#statusline#Count(l:buffer)
  if l:warn > 0 && l:err == 0
    return printf('[%sW]', l:warn)
  elseif l:warn > 0
    return printf('[%sW|', l:warn)
  endif
  return ''
endfunction

function! g:StatuslineLintOK()
  if !exists('g:loaded_ale')
    return ''
  endif
  let l:buffer = bufnr('%')
  if !has_key(g:ale_buffer_info, l:buffer)
    return ''
  endif
  let [l:err, l:warn] = ale#statusline#Count(l:buffer)
  if l:err == 0 && l:warn == 0
    return '[OK]'
  endif
  return ''
endfunction



set statusline+=%#sbNormal#
" cwd
set statusline+=%{substitute(getcwd(),'^'.escape($HOME,'/'),'~','')}·
" Buffer number.
set statusline+=%n·
" File type.
set statusline+=%Y


set statusline+=%#sbOk#
" Current git branch
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
" Existing view files
set statusline+=%{exists('g:loaded_viewport')?viewport#status#info():''}
" Session tracking
set statusline+=%{exists('g:loaded_obsession')?ObsessionStatus():''}
" Let me know if linting is looking good
set statusline+=%{StatuslineLintOK()}
" Current indentation, if sane
set statusline+=%{exists('g:loaded_tabloid')?tabloid#status#info():''}


set statusline+=%#sbNotify#
" Modified file
set statusline+=%m
" File is read-only
set statusline+=%r
" Existing view files
set statusline+=%{exists('g:loaded_viewport')?viewport#status#alert():''}
" File mixes tabs and indents on purpose
set statusline+=%{exists('g:loaded_tabloid')?tabloid#status#alert():''}


set statusline+=%#sbWarning#
" fileformat is not unix
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
" File is not UTF-8
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
" Paste is set
set statusline+=%{&paste?'[paste]':''}
" Trailing whitespace
set statusline+=%{exists('g:loaded_trailguide')?trailguide#status#warning():''}
" Line too long
set statusline+=%{exists('g:loaded_longline')?longline#status#warning():''}


" Linter has warnings. Should be immediately before linter errors.
set statusline+=%{StatuslineLintWarn()}


set statusline+=%#sbError#
" Linter has errors
set statusline+=%{StatuslineLintErr()}


" Reset style.
set statusline+=%*
set statusline+=%#sbNormal#

" Move to left side.
set statusline+=%=


" Show the highlight group.
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}·
" column|line/total
set statusline+=%c%V\|%l\/%L
" Position in file
set statusline+=\ %P
