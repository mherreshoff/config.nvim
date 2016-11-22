" Should be in 'after', as it may depend upon other plugins.

" Always show the status line.
set laststatus=2
set statusline=


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


set statusline+=%#sbError#
" Tabbing is set incorrectly
set statusline+=%{exists('g:loaded_tabloid')?tabloid#status#error():''}
" Errors detected
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}


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
