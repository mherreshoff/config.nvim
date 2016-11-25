" ============================================================================
" Remappings =================================================================
" Get to ex mode slightly faster:
noremap ; :
" Get to ex-mode-in-vim ever:
noremap : :<c-f>
" A convenient leader key for dvorak users:
let mapleader=','
" ; and , have now lost their homes. Let's find new ones:
noremap <leader>f ;
noremap <leader>F ,
" The marks that are exact (rather than line-level) should be easier to type:
noremap ' `
noremap ` '
" <C-B> will be used for tmux emulation, more or less.
nnoremap <C-B> <NOP>
" These make it easier to indent / unindent using visual mode:
vnoremap < <gv
vnoremap > >gv
" This makes it harder to lose work via accidental <C-U>.
inoremap <C-U> <C-G>u<C-U>
" EXPERIMENTAL: By default, we join lines w/out adding spaces.  Use gJ for the
" normal behavior.
noremap J gJ
noremap gJ J


" ============================================================================
" Basic settings =============================================================
set autoindent                    " Copy indent from current line.
set backspace=indent,eol,start    " Make backspace sane.
set backup                        " Always be safe.
set breakindent                   " Wrap indented lines better
set cursorline                    " Highlight the current line.
" NOTE: when you're having trouble, :verbose set fo? and go nuke their changes.
" See also |fo-table|.
set formatoptions=2qnlj           " Add a leading car to put it on auto.
set gdefault                      " Replace globally by default.
set hidden                        " Allow buffer backgrounding.
set history=1000                  " Remember a lot
set incsearch                     " Search incrementally as I type.
set nocindent nosmartindent       " Because we're autoindenting!
set nohls                         " Highlighting searches by default is annoying.
noremap <leader>? :set invhls<CR>
set notimeout                     " I dislike ambiguous mappings
set number                        " Make the current line show absolutely.
set relativenumber                " Make line numbers cursor-relative.
set scrolloff=3                   " Add top/bottom scroll margins.
set showcmd                       " Show the last command.
set showmatch                     " When a bracket is typed show its match.
set showtabline=0                 " Just use :tabs and buffers.
set smartcase ignorecase          " Ignore case unless there are cased characters.
set smarttab                      " Shiftwidth is only for indents.
set splitbelow splitright         " Windows should split in the direction I read.
set undofile                      " Undo across sessions.
set viewoptions+=unix,slash       " Make windows views compatible.
set viewoptions=cursor,folds      " Save fold & cursor locations.
set visualbell                    " Don't make noise.
set winminheight=0                " Squish windows as much as you like.
set mouse=a                       " Allow mouse interactions.
set termguicolors                 " Use real colors.


" ============================================================================
" Vim command line file navigation ===========================================
set nowildmenu
set wildignore=*.aux,*.bak,*.class,*.dll,*.exe,*.gif,*.jpeg,*.jpg,*.png,*.o,*.pyc,dist/**,tags
set wildmode=list:longest
" Note: if you want to turn the wildmenu on, and you want to cnoremap the <Up>
" and <Down> keys, recall that it's hard to remap <Down>, and read
" stackoverflow.com/questions/14842987


" ============================================================================
" Tab management =============================================================
" Note that some indent files, which use &sw instead of shiftwidth(), will
" break with these settings. If you're having trouble, consider changing these
" all to 2 or whatever.
set tabstop=2
set shiftwidth=0                  " Now the shiftwidth() function will use &tabstop
set softtabstop=-1                " Use the shiftwidth
set expandtab                      " Alas, this appears to be where society converged.


" ============================================================================
" Hidden characters ==========================================================
set listchars=tab:▷\ ,eol:¬,extends:»,precedes:«
noremap <leader>h :set list!<CR>


" ============================================================================
" Neovim global variables (ugh) ==============================================
let g:terminal_scrollback_buffer_size = 2147483647


" Metadata storage -----------------------------------------------------------
set viewdir=~/.local/share/nvim/view
set shada='100,<50,s10

" Nvim needs us to make this directory on our own:
let s:backupdir = expand('~/.local/share/nvim/backup')
if !isdirectory(s:backupdir)
  echomsg 'Creating backup directory.'
  try
    call mkdir(s:backupdir, 'p')
    " And since we're setting things up on a new system, let's check whether you
    " want us to download the spell files too.
    set spell
    set nospell
  catch /E739:/
    " We're probably booting nvim from a process that couldn't create the
    " directory if it wanted to. Ignore.
    " (We'll get error messages when trying to save w/out a backup to notify
    " us that something's wrong.)
  endtry
endif
let &backupdir = s:backupdir
unlet s:backupdir


" ============================================================================
" Plugin time! ===============================================================
" Not everything below will actually be plugins. What you'll actually find is
" a lot of functionality that I want, some of which can be found in plugins,
" many of which need lots of configuration.
call plug#begin('~/.config/nvim/packages')


" ----------------------------------------------------------------------------
" Real basic vim functionality -----------------------------------------------
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Soares/eunuch.vim'
" Plug 'tpope/vim-obsession'  -- I'm rusty on this one and need to spend some time with it.


" ----------------------------------------------------------------------------
" Color management -----------------------------------------------------------
" If and when you get a transparent terminal, turn this on.
let g:base16_transparent_background = 0

" Personal color groups:
let g:base16_color_overrides = {
      \ 'sbError': 'fg=dark3 bg=red bold',
      \ 'sbWarning': 'fg=dark3 bg=orange',
      \ 'sbNotify': 'fg=dark3 bg=yellow',
      \ 'sbOk': 'fg=dark3 bg=green'}

" Changes to the base theme
let g:base16_color_modifiers = {
      \ 'Comment': 'fg=similar1'}

" Hacks to prevent me from writing my own syntax files
call extend(g:base16_color_overrides, {
      \ 'vimCommentTitle': 'fg=yellow italic',
      \ 'ALEErrorSign': 'fg=red bg=similar3 bold',
      \ 'ALEWarningSign': 'fg=orange bg=similar3 bold'})

Plug 'Soares/base16.nvim'


" ----------------------------------------------------------------------------
" A whole bunch of filetype extensions ---------------------------------------
" Some are disabled by default, but vetted. Enable if you'd like.
Plug 'Soares/fish.vim'

Plug 'tpope/vim-markdown'

let g:vimtex_imaps_enabled = 0
Plug 'lervag/vimtex'

" Plug 'derekelkins/agda-vim'


" ----------------------------------------------------------------------------
" Opinionated plugins that I use regularly -----------------------------------
let g:write_auto = ['text', 'markdown', 'tex', 'help!']
noremap <leader>w :Write<CR>
Plug 'Soares/write.vim'

noremap <leader>bd :Bclose<CR>
noremap <leader>bD :Bclose!<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
noremap <leader>bl :ls<CR>
noremap <leader>bt :b#<CR>
Plug 'Soares/butane.vim'

execute 'noremap <leader>a :Ag '
Plug 'rking/ag.vim'

let g:rooter_silent_chdir = 1
Plug 'airblade/vim-rooter'

let g:gutentags_cache_dir = '~/.cache/tags'
Plug 'ludovicchabant/vim-gutentags'


" ----------------------------------------------------------------------------
" The Land of Version Control ------------------------------------------------
noremap <leader>gs :Gstatus<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gu :Git push origin master<CR>
Plug 'tpope/vim-fugitive'


" ----------------------------------------------------------------------------
" Terminal emulator management -----------------------------------------------
tnoremap <ESC> <C-\><C-n>
tnoremap <C-B>x <ESC>
tnoremap <C-B><C-B> <C-B>
tnoremap <C-B><C-P> <C-\><C-n>:normal "+pa<CR>

function! s:SmartSwitch()
  if &buftype == 'terminal' && bufexists(0)
    call feedkeys("\<C-^>", 'n')
  elseif &buftype == 'terminal'
    normal a
  elseif bufname('#') =~# '^term://'
    " TODO: change this to
    " call feedkeys("\<C-^>", 'n')
    " after the bug listed here:
    " https://github.com/neovim/neovim/issues/5667
    " gets fixed.
    terminal
    " In the meantime, we'll spawn more terms than we need.
  else
    terminal
  endif
endfunction

function! s:nvimux(key, command)
  for l:mode in split('nvit', '\zs')
    let l:exit = (l:mode == 't') ? '<C-\><C-n>' : (l:mode == 'i') ? '<ESC>' : ''
    execute l:mode.'noremap' '<silent>' '<C-B>'.a:key l:exit.a:command
  endfor
endfunction

call s:nvimux('a', '<C-^>')
call s:nvimux('t', ':$tabnew<CR>')
call s:nvimux('v', ':vnew<CR>')
call s:nvimux('s', ':new<CR>')
for s:i in [1, 2, 3, 4, 5, 6, 7, 8, 9]
  call s:nvimux(s:i, s:i.'gt')
endfor
call s:nvimux('n', 'gt')
call s:nvimux('p', 'gT')
call s:nvimux('h', '<C-w><C-h>')
call s:nvimux('j', '<C-w><C-j>')
call s:nvimux('k', '<C-w><C-k>')
call s:nvimux('l', '<C-w><C-l>')
call s:nvimux('<space>', ':call <SID>SmartSwitch()<CR>')

unlet s:i
delfunction s:nvimux

augroup nvimux
  autocmd!
  " FZF handles closing itself.
  " (You'd think we could just bd! and not worry about it, but bd! works
  " differently depending on whether we're editing a directory or some other
  " file. Argh.
  autocmd TermClose * if bufname('%') !~# '^term://.*/fzf\>' | bd! | endif
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
augroup end


" ----------------------------------------------------------------------------
" Fuzzy finding for navigation and great profit ------------------------------
let g:fzf_command_prefix = 'FZF'
let g:fzf_action = {'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit'}
noremap <leader>o :FZFFiles<CR>
noremap <leader>eb :FZFBuffers<CR>
noremap <leader>eco :FZFColors<CR>
noremap <leader>ecm :FZFCommands<CR>
noremap <leader>el :FZFLines<CR>
noremap <leader>eL :FZFBLines<CR>
noremap <leader><leader> :FZFBLines<CR>
noremap <leader>et :FZFTags<CR>
noremap <leader>eT :FZFBTags<CR>
noremap <leader>em :FZFMarks<CR>
noremap <leader>ew :FZFWindows<CR>
noremap <leader>eh :FZFHistory<CR>
noremap <leader>e; :FZFHistory:<CR>
noremap <leader>e/ :FZFHistory/<CR>
noremap <leader>eg :FZFCommits<CR>
noremap <leader>eG :FZFBCommits<CR>
noremap <leader>e? :FZFHelptags<CR>
noremap <leader>eft :FZFFiletypes<CR>
" Reminder: you may also want to look into <plug>(fzf-complete-word).
imap <c-g><c-g> <plug>(fzf-complete-path)
augroup so8res_fzf
  autocmd!
"  autocmd TermClose term://*/fzf* echomsg 'fzf too!' | bd!
  autocmd FileType fzf :tnoremap <buffer> <ESC> <C-G>
augroup end
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l'
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Identifier'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Identifier'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'PreProc'],
    \ 'pointer': ['fg', 'PreProc'],
    \ 'marker':  ['fg', 'Constant'],
    \ 'spinner': ['fg', 'Constant'],
    \ 'header':  ['fg', 'Comment'] }
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" ----------------------------------------------------------------------------
" Fuzzy completion while writing code ----------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <silent><expr> <C-e> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <silent><expr> <CR> pumvisible() ? deoplete#mappings#close_popup()."\<CR>" : "\<CR>"
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


" ----------------------------------------------------------------------------
" Linting --------------------------------------------------------------------
noremap <silent> <leader>lo :execute empty(getloclist(0)) ? 'copen' : 'lopen'<CR>
noremap <silent> <leader>lc :execute empty(getloclist(0)) ? 'cclose' : 'lclose'<CR>
noremap <silent> <leader>lg :execute empty(getloclist(0)) ? 'cc' : 'll'<CR>
nmap <silent> <leader>ll <Plug>(ale_next_wrap)
nmap <silent> <leader>lh <Plug>(ale_previous_wrap)
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
" TODO: set 'haskell' to 'all' when the bug mentioned here:
" https://github.com/w0rp/ale/issues/188
" is fixed.
let g:ale_linters = {'haskell': ['hlint']}
Plug 'w0rp/ale'


" ----------------------------------------------------------------------------
" Editing directories --------------------------------------------------------
noremap <leader>cp :pwd<CR>
noremap <leader>cd :lcd %:h<CR>:pwd<CR>
noremap <leader>cc :e %:h<CR>
noremap <leader>cg :execute 'edit' getcwd()<CR>

function! s:SetupDirvish()
  " Hide dot-files by default
  call s:ToggleDotfiles()
  " Map gh to toggle showing hidden files
  nnoremap <buffer> gh :call <SID>ToggleDotfiles()<CR>
  " Add tab mappings
  nnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
  xnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
  " Local cd into the directory we're editing
  lcd %
endfun

function! s:ToggleDotfiles()
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

augroup dirvishsetup
    autocmd!
    autocmd FileType dirvish call s:SetupDirvish()
augroup END

Plug 'justinmk/vim-dirvish'


" ----------------------------------------------------------------------------
" Handling view files --------------------------------------------------------
function! s:MakeViewCheck()
  " Here's a whole bunch of ways that we could fail to want a view file.
  " (To prevent an individual buffer from getting a view,
  " let b:makeviewfile = 0.)
  if &l:diff | return 0 | endif
  if &buftype != '' | return 0 | endif
  if expand('%') =~ '\[.*\]' | return 0 | endif
  if empty(glob(expand('%:p'))) | return 0 | endif
  if &modifiable == 0 | return 0 | endif
  if len($TEMP) && expand('%:p:h') == $TEMP | return 0 | endif
  if len($TMP) && expand('%:p:h') == $TMP | return 0 | endif
  if exists('b:makeviewfile') && !b:makeviewfile | return 0 | endif
  return 1
endfunction

augroup makeviewfile
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePre,BufWinLeave ?* if <SID>MakeViewCheck() | silent! mkview | endif
    autocmd BufWinEnter ?* if <SID>MakeViewCheck() | silent! loadview | endif
augroup END


" ----------------------------------------------------------------------------
" Quickfix and location list manipulation ------------------------------------
function! s:executeQuickFixBindings()
  let l:matches_window_prefix = empty(getloclist(0)) ? 'c' : 'l'
  " from ag.vim
  nnoremap <silent> <buffer> h  <C-W><CR><C-w>K
  nnoremap <silent> <buffer> H  <C-W><CR><C-w>K<C-w>b
  nnoremap <silent> <buffer> o  <CR>
  nnoremap <silent> <buffer> t  <C-w><CR><C-w>T
  nnoremap <silent> <buffer> T  <C-w><CR><C-w>TgT<C-W><C-W>
  nnoremap <silent> <buffer> v  <C-w><CR><C-w>H

  exe 'nnoremap <silent> <buffer> e <CR><C-w><C-w>:' . l:matches_window_prefix .'close<CR>'
  exe 'nnoremap <silent> <buffer> go <CR>:' . l:matches_window_prefix . 'open<CR>'
  exe 'nnoremap <silent> <buffer> q  :' . l:matches_window_prefix . 'close<CR>'
  exe 'nnoremap <silent> <buffer> gv <C-w><CR><C-w>H:' . l:matches_window_prefix . 'open<CR><C-w>J'
  exe 'autocmd BufLeave <buffer> ' . l:matches_window_prefix . 'close'
endfunction

augroup quickfix
  autocmd!
  autocmd FileType qf call <SID>executeQuickFixBindings()
augroup end


" ----------------------------------------------------------------------------
" Custom navigation shortcuts ------------------------------------------------
function! s:Go(place)
  execute 'edit' a:place
  if isdirectory(a:place)
    lcd %
  else
    lcd %:h
  endif
endfunction

" ,gh takes you home.
" ,gi takes you to your init.vim file.
" ,gn takes you to the directory in which your neovim config lives.
noremap <leader>gh :call <SID>Go('~/')<CR>
execute 'noremap <leader>gi :call <SID>Go("'.expand('<sfile>:p').'")<CR>'
execute 'noremap <leader>gn :call <SID>Go("'.expand('<sfile>:p:h').'")<CR>'

if isdirectory(expand('~/Downloads'))
  noremap <leader>gd :call <SID>Go('~/Downloads')<CR>
endif
if isdirectory(expand('~/Dropbox'))
  noremap <leader>gx :call <SID>Go('~/Dropbox')<CR>
endif
noremap <leader>g? :echomsg "[h]ome ǁ [i]nit.vim ǁ nvim [c]onfig dir ǁ [d]ownloads ǁ dropbo[x]"<CR>

call plug#end()


" ============================================================================
" Turn everything on and let's roll. =========================================
filetype plugin indent on
set background=light
colorscheme summerfruit
