set backspace=indent,eol,start  " Make backspace sane.
noremap ; :

call plug#begin('~/.config/nvim/packages')
Plug 'tpope/vim-fugitive'
call plug#end()
