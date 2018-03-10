call plug#begin('~/.vim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme NeoSolarized

set number " show line numbers

let g:airline_symbols_ascii = 1
