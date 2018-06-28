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
" Easier tag nav
nnoremap <C-S> <C-]>
" These make it easier to indent / unindent using visual mode:
vnoremap < <gv
vnoremap > >gv
" This makes it harder to lose work via accidental <C-U>.
inoremap <C-U> <C-G>u<C-U>
" Don't close the last window unless I mean it (as demonstrated by me putting
" a space in front of the command).
" cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>
" Write the shit out of a file when I forgot to sudo
cnoremap  w!! w !sudo tee % > /dev/null
" Select what's just been pasted
nnoremap gV `[V`]
" remove trailing whitespace
nnoremap <leader>tr :%s/[ \t]\+$/<CR><C-O>


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
set showtabline=1                 " Experimental
set smartcase ignorecase          " Ignore case unless there are cased characters.
set smarttab                      " Shiftwidth is only for indents.
set splitbelow splitright         " Windows should split in the direction I read.
set undofile                      " Undo across sessions.
set viewoptions+=unix,slash       " Make windows views compatible.
set viewoptions=cursor,folds      " Save fold & cursor locations.
set visualbell                    " Don't make noise.
set winminheight=0                " Squish windows as much as you like.
set mouse=nicr                    " Allow mouse interactions.  (r is experimental)
set termguicolors                 " Use real colors.
set inccommand=                   " TODO: turn on later.
set nojoinspaces


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
set expandtab                     " Alas, this appears to be where society converged.
set textwidth=127                 " allow longer lines
set nowrap


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
" Handling diff between focused and unfocused windows ========================
augroup highlight_follows_focus
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

augroup highligh_follows_vim
    autocmd!
    autocmd FocusGained * set cursorline
    autocmd FocusLost * set nocursorline
augroup END


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

" :Obsess when you need to.
Plug 'tpope/vim-obsession'

" This one is configured down below.
Plug 'Soares/base16.nvim'


" ----------------------------------------------------------------------------
" A whole bunch of filetype extensions ---------------------------------------
" Some are disabled by default, but vetted. Enable if you'd like.
Plug 'Soares/fish.vim'

Plug 'tpope/vim-markdown'

let g:vimtex_imaps_enabled = 0
Plug 'lervag/vimtex'

autocmd BufNewFile,BufRead *.json set ft=javascript

" Plug 'derekelkins/agda-vim'


" ----------------------------------------------------------------------------
" Opinionated plugins that I use regularly -----------------------------------
let g:write_auto = ['text', 'markdown', 'tex', 'help!']
noremap <leader>w :Write<CR>
Plug 'Soares/write.vim'

noremap <leader>bd :Bclose<CR>
noremap <leader>bD :Bclose!<CR>
Plug 'Soares/butane.vim'

execute 'noremap <leader>a :Ag! '
let g:ag_prg = 'ag --ignore output/ --ignore logs/ --ignore .cache/ --vimgrep'
let g:ag_apply_qmappings=0
let g:ag_apply_lmappings=0
let g:ag_mapping_message=0
Plug 'rking/ag.vim'

let g:rooter_silent_chdir = 1
Plug 'airblade/vim-rooter'

let g:gutentags_cache_dir = '~/.cache/tags'
Plug 'ludovicchabant/vim-gutentags'


" ----------------------------------------------------------------------------
" the EXPERIMENTAL ZONE! -----------------------------------------------------
noremap <leader>g? :GitGutterToggle<CR>
let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
Plug 'airblade/vim-gitgutter'

" Plug 'easymotion/vim-easymotion'

noremap <leader>u? :GundoToggle<CR>
Plug 'sjl/gundo.vim'

Plug 'tpope/vim-abolish'

Plug 'metakirby5/codi.vim'

let g:vim_isort_map = ''
" TODO: python-only mapping:
noremap <leader>is :Isort<CR>
Plug 'fisadev/vim-isort'

" Consider 'mhinz/vim-startify' one day.

" Lean
Plug 'leanprover/lean.vim'
" This gives us syntax highlighting.

" TODO: integrate with https://github.com/autozimu/LanguageClient-neovim

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

function! s:nvimux(map, key, command)
  for l:mode in split('nvit', '\zs')
    let l:exit = (l:mode == 't') ? '<C-\><C-n>' : (l:mode == 'i') ? '<ESC>' : ''
    execute l:mode.a:map '<silent>' '<C-B>'.a:key l:exit.a:command
  endfor
endfunction

for s:i in [1, 2, 3, 4, 5, 6, 7, 8, 9]
  call s:nvimux('map', s:i, '<Plug>AirlineSelectTab'.s:i)
endfor
call s:nvimux('noremap', 'a', '<C-^>')
call s:nvimux('noremap', 't', ':$tabnew<CR>')
call s:nvimux('noremap', 'v', ':vnew<CR>')
call s:nvimux('noremap', 's', ':new<CR>')
call s:nvimux('noremap', 'n', ':bn<CR>')
call s:nvimux('noremap', 'p', ':bp<CR>')
call s:nvimux('noremap', 'u', 'gt')
call s:nvimux('noremap', 'd', 'gT')
call s:nvimux('noremap', 'h', '<C-w><C-h>')
call s:nvimux('noremap', 'j', '<C-w><C-j>')
call s:nvimux('noremap', 'k', '<C-w><C-k>')
call s:nvimux('noremap', 'l', '<C-w><C-l>')
call s:nvimux('noremap', '?', ':ls<CR>')
call s:nvimux('noremap', '<space>', ':call <SID>SmartSwitch()<CR>')

unlet s:i
delfunction s:nvimux

augroup nvimux
  autocmd!
  " FZF handles closing itself.
  " (You'd think we could just bd! and not worry about it, but bd! works
  " differently depending on whether we're editing a directory or some other
  " file. Argh.
  autocmd TermClose * if bufname('%') !~# '^term://.*/fzf\>' | bd! | AirlineRefresh | endif
  " autocmd BufWinEnter,WinEnter term://* startinsert
  " autocmd BufLeave term://* stopinsert
augroup end


" ----------------------------------------------------------------------------
" Swap search pattern with the one that came before it. ----------------------
" Could be promoted to a plugin eventually.
function! s:ToggleSearchPattern()
    let next_search_pattern_index = -1
    if @/ ==# histget('search', -1)
        let next_search_pattern_index = -2
    endif
    let @/ = histget('search', next_search_pattern_index)
endfunction

nnoremap <silent> <Leader>/ :<C-u>call <SID>ToggleSearchPattern()<CR>


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
  autocmd FileType fzf :tnoremap <buffer> <ESC> <C-G>
augroup end
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore output/ --ignore logs/ --ignore .cache/ -l'
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Normal'],
      \ 'fg+':     ['fg', 'Normal'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'hl+':     ['fg', 'Normal'],
      \ 'info':    ['fg', 'Normal'],
      \ 'prompt':  ['fg', 'Normal'],
      \ 'pointer': ['fg', 'Normal'],
      \ 'marker':  ['fg', 'Normal'],
      \ 'spinner': ['fg', 'Normal'],
      \ 'header':  ['fg', 'Normal'] }
Plug 'junegunn/fzf', {'dir': '~/.config/fzf', 'do': './install --all'}
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
" nmap <silent> <leader>ln <Plug>(ale_next_wrap)
" nmap <silent> <leader>ll <Plug>(ale_next_wrap)
" nmap <silent> <leader>lh <Plug>(ale_previous_wrap)

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_change = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
" When https://github.com/w0rp/ale/issues/122 is fixed, we'll bind ,lq to
" toggle the linter or whatever. Right now, if this is pissing you off, just
" comment out the below line.
" Plug 'w0rp/ale'


" ----------------------------------------------------------------------------
" Editing directories --------------------------------------------------------
noremap <leader>cp :pwd<CR>
noremap <leader>cd :lcd %:h<CR>:pwd<CR>
noremap <leader>cc :e %:h<CR>
noremap <leader>cg :execute 'edit' getcwd()<CR>

function! s:SetupDirvish()
  " Hide dot-files by default
  call s:ToggleDotfiles(0)
  " Map gh to toggle showing hidden files
  nnoremap <buffer> gh :call <SID>ToggleDotfiles(1)<CR>
  " Add tab mappings
  nnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
  xnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
  " Local cd into the directory we're editing
  lcd %
endfun

function! s:ToggleDotfiles(mode)
  " If mode is 0, dotfiles are turned off.
  " Otherwise, dotfiles are toggled
  if &filetype != 'dirvish' | return | endif
  let l:line = line('.')
  " Store dotfiles in b:dotfiles and remove
  if a:mode == 0 || !exists('b:dotfiles')
    let l:h = @h
    let @h = ''
    silent! g@\v/(\.[^\/]+|[^\/]+\.pyc)/?$@y H
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
" And tell netrw to screw off, too.
let g:loaded_netrwPlugin = 1


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
  let l:c = empty(getloclist(0)) ? 'c' : 'l'
  " from ag.vim
  " nnoremap <silent> <buffer> h  <C-W><CR><C-w>K
  " nnoremap <silent> <buffer> H  <C-W><CR><C-w>K<C-w>b
  " nnoremap <silent> <buffer> o  <CR>
  " nnoremap <silent> <buffer> t  <C-w><CR><C-w>T
  " nnoremap <silent> <buffer> T  <C-w><CR><C-w>TgT<C-W><C-W>
  " nnoremap <silent> <buffer> v  <C-w><CR><C-w>L
  nnoremap <silent> <buffer> <C-S> <C-W><CR><C-W>J
  execute 'nnoremap <silent> <buffer> g<C-S> <C-W><CR><C-W>J:botright '.l:c.'open<CR>'
  nnoremap <silent> <buffer> <C-V> <C-W><CR><C-W>L
  execute 'nnoremap <silent> <buffer> g<C-V> <C-W><CR><C-W>L:botright '.l:c.'open<CR>'
  nnoremap <silent> <buffer> <C-T> <C-W><CR><C-W>T
  execute 'nnoremap <silent> <buffer> g<C-T> <C-W><CR><C-W>TgT:botright '.l:c.'open<CR>'
  nnoremap <silent> <buffer> <C-E>  <CR>
  exe 'nnoremap <silent> <buffer> g<C-E> <CR>:botright '.l:c.'open<CR>'

  exe 'nnoremap <silent> <buffer> q  :'.l:c.'close<CR>'
  exe 'nnoremap <silent> <buffer> <ESC> :'.l:c.'close<CR>'
  exe 'autocmd BufLeave <buffer> '.l:c.'close'
endfunction

noremap <silent> <leader>ln :execute (empty(getloclist(0)) ? 'c' : 'l').'next'<CR>
noremap <silent> <leader>lp :execute (empty(getloclist(0)) ? 'c' : 'l').'previous'<CR>
noremap <silent> <leader>lo :execute 'botright' (empty(getloclist(0)) ? 'c' : 'l').'open'<CR>
noremap <silent> <leader>lc :execute (empty(getloclist(0)) ? 'c' : 'l').'close'<CR>
noremap <silent> <leader>lg :execute empty(getloclist(0)) ? 'cc' : 'll'<CR>
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
noremap <leader>th :call <SID>Go('~/')<CR>
execute 'noremap <leader>ti :call <SID>Go("'.expand('<sfile>:p').'")<CR>'
execute 'noremap <leader>tn :call <SID>Go("'.expand('<sfile>:p:h').'")<CR>'
execute 'noremap <leader>tc :call <SID>Go("~/.config")<CR>'

if isdirectory(expand('~/Downloads'))
  noremap <leader>td :call <SID>Go('~/Downloads')<CR>
endif
if isdirectory(expand('~/Dropbox'))
  noremap <leader>tx :call <SID>Go('~/Dropbox')<CR>
endif
noremap <leader>t? :echomsg "[h]ome ǁ [i]nit.vim ǁ nvim [c]onfig dir ǁ [d]ownloads ǁ dropbo[x]"<CR>


" ----------------------------------------------------------------------------
" Statusline management ------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_detect_spell = 0
let g:airline#extensions#whitespace#checks = ['indent', 'mixed-indent-file']
Plug 'Soares/vim-airline'

Plug 'lukaszkorecki/workflowish'

" Becasue I still need some way to get the synID:
noremap <leader>sid :echomsg synIDattr(synID(line('.'),col('.'),1),'name')<CR>

call plug#end()
filetype plugin indent on


" ============================================================================
" Color management ===========================================================
let g:base16_airline = 1
" When the following bug is fixed:
" https://github.com/neovim/neovim/issues/5668
" and the terminal has a transparent backgroun, then we can enable this.
" (we'll need to set base16_shell_path or something too).
let g:base16_transparent_background = 0

" Changes to the base theme
let g:base16_color_modifiers = {
      \ 'ErrorMsg': 'fg=red bg=none none',
      \ 'Comment': 'fg=green'}

" Hacks to prevent me from writing my own syntax files
let g:base16_color_overrides = {
      \ 'vimCommentTitle': 'fg=yellow italic',
      \ 'ALEErrorSign': 'fg=red bg=similar3 bold',
      \ 'ALEWarningSign': 'fg=orange bg=similar3 bold',
      \ 'fzf1': 'fg=red bg=similar2',
      \ 'fzf2': 'fg=contrast1 bg=similar2',
      \ 'fzf3': 'fg=contrast2 bg=similar2',
      \ 'GitGutterAdd': 'fg=green bg=similar3',
      \ 'GitGutterChange': 'fg=yellow bg=similar3',
      \ 'GitGutterDelete': 'fg=red bg=similar3',
      \ 'GitGutterChangeDelete': 'fg=orange bg=similar3'}

set background=dark
colorscheme summerfruit

" Let's roll.
