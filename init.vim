" Remappings
noremap ' `
noremap ` '

let mapleader=","
noremap _ ,
noremap - ;
nnoremap <C-B> <NOP>
vnoremap < <gv
vnoremap > >gv

noremap ; :
noremap : :<c-f>

" Basic settings:
set autoindent                  " Copy indent from current line.
set backspace=indent,eol,start  " Make backspace sane.
set backup                      " Always be safe.
set breakindent                 " Wrap indented lines better
set cursorline                  " Highlight the current line.
set formatoptions=cqn1j         " see :help fo-table.
set gdefault                    " Replace globally by default.
set hidden                      " Allow buffer backgrounding.
set history=1000                " Remember a lot
set incsearch                   " Search incrementally as I type.
set nocindent nosmartindent     " Because we're autoindenting!
set nohls                       " Highlighting searches by default is annoying.
set notimeout                   " I dislike ambiguous mapping,
noremap <leader>? :set invhls<CR>
set number                      " Make the current line show absolutely.
set relativenumber              " Make line numbers cursor-relative.
set scrolloff=3                 " Add top/bottom scroll margins.
set showcmd                     " Show the last command.
set showmatch                   " When a bracket is typed show its match.
set showtabline=0               " Just use :tabs and buffers.
set smartcase ignorecase        " Ignore case unless there are cased characters.
set smarttab                    " Shiftwidth is only for indents.
set splitbelow splitright       " Windows should split in the direction I read.
set undofile                    " Undo across sessions.
set viewoptions+=unix,slash     " Make windows views compatible.
set viewoptions=cursor,folds    " Save fold & cursor locations.
set visualbell                  " Don't make noise.
set wildmenu                    " Enhanced completion.
set wildmode=list:longest       " Act like shell completion.
set winminheight=0              " Squish windows as much as you like.
set mouse=a

" Hidden Character handling:
set listchars=tab:▷\ ,eol:¬,extends:»,precedes:«
noremap <leader>h :set list!<CR>

" Tab handling
set tabstop=2       " A sensible default.
set shiftwidth=2    " Sure would be nice if we could set this to 0.
set softtabstop=2   " (And this to -1.) I think it's a vim syntax files problem.
set expandtab

let g:terminal_scrollback_buffer_size = 2147483647

" Quickfix and location list behavior:
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


" Ignored Filetypes:
let wildignore = join([
\	'*.aux',
\	'*.bak',
\	'*.class',
\	'*.dll',
\	'*.exe',
\	'*.gif',
\	'*.jpeg',
\	'*.jpg',
\	'*.o',
\	'*.png',
\	'*.pyc',
\	'dist/**',
\	'tags',
\	], ',')

" Metadata Storage:
set viewdir=~/.local/share/nvim/view
set backupdir=~/.local/share/nvim/backup
set viminfo=\"4,'100,/100,:100,h,f1

" Plugin Management:
call plug#begin('~/.config/nvim/packages')

Plug 'Soares/fish.vim'
Plug 'tpope/vim-markdown'
let g:vimtex_imaps_enabled = 0
Plug 'lervag/vimtex'

" Plug 'Soares/trailguide.vim'
let g:write_auto = ['text', 'markdown', 'tex', 'help!']
noremap <leader>w :Write<CR>
Plug 'Soares/write.vim'
execute 'noremap <leader>a :Ag '
Plug 'rking/ag.vim'
noremap <leader>bd :Bclose<CR>
noremap <leader>bD :Bclose!<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
noremap <leader>bl :ls<CR>
noremap <leader>bt :b#<CR>
Plug 'Soares/butane.vim'
Plug 'Soares/eunuch.vim'
Plug 'Soares/nvimux.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
noremap <leader>gs :Gstatus<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gu :Git push origin master<CR>
Plug 'tpope/vim-fugitive'

noremap <leader>cp :pwd<CR>
noremap <leader>cd :lcd %:h<CR>:pwd<CR>
noremap <leader>cg :execute 'edit' getcwd()<CR>
noremap <leader>cc :e %:h<CR>
" augroup so8res_dirvish
"   autocmd!
"   autocmd FileType dirvish silent lcd %
" augroup end
Plug 'justinmk/vim-dirvish'

execute 'noremap <leader>ed :Files '
let g:fzf_command_prefix = 'FZF'
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
let g:fzf_action = {'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit'}
imap <c-g><c-g> <plug>(fzf-complete-word)
imap <c-g><c-p> <plug>(fzf-complete-path)
augroup so8res_fzf
  autocmd!
  autocmd BufLeave term://*/fzf* bd!
  autocmd FileType fzf :tnoremap <buffer> <ESC> <C-G>
augroup end
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'tpope/vim-obsession'
" Plug 'Soares/longline.vim'
" Plug 'Soares/tabdiff.vim'
" Plug 'tommcdo/vim-exchange'
" Plug 'derekelkins/agda-vim'
" Plug 'ludovicchabant/vim-gutentags'

" autocds to project directory (as identified e.g. by a .git dir)
let g:rooter_silent_chdir = 1
Plug 'airblade/vim-rooter'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <silent><expr> <C-e> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <silent><expr> <CR> pumvisible() ? deoplete#mappings#close_popup()."\<CR>" : "\<CR>"
execute 'inoremap <silent> <C-@> <C-n> '
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:gutentags_cache_dir = '~/.cache/tags'
Plug 'ludovicchabant/vim-gutentags'

let g:neomake_javascript_enabled_makers = ['eslint']
noremap <silent> <leader>lo :execute empty(getloclist(0)) ? 'copen' : 'lopen'<CR>
noremap <silent> <leader>lc :execute empty(getloclist(0)) ? 'cclose' : 'lclose'<CR>
noremap <silent> <leader>ll :execute empty(getloclist(0)) ? 'cc' : 'll'<CR>
noremap <silent> <leader>ln :execute empty(getloclist(0)) ? 'cnext' : 'lnext'<CR>
noremap <silent> <leader>lp :execute empty(getloclist(0)) ? 'cprev' : 'cprev'<CR>
noremap <silent> <leader>li :Neomake<CR>                      " Lint.
" autocmd! BufWritePost,BufEnter * Neomake
Plug 'neomake/neomake'

call plug#end()

filetype plugin indent on

set termguicolors
set background=dark
let g:base16_transparent_background = 1
let g:base16_color_overrides = {
      \ 'sbError': 'fg=dark2 bg=red bold',
      \ 'sbWarning': 'fg=dark2 bg=orange',
      \ 'sbNotify': 'fg=dark2 bg=yellow',
      \ 'sbOk': 'fg=dark2 bg=green'}
" let g:base16_color_modifications = {
"       \ 'Comment': 'fg=green'}
" colorscheme summerfruit
