call plug#begin('~/.vim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'junegunn/fzf'
Plug 'roxma/nvim-completion-manager'

call plug#end()

colorscheme NeoSolarized

set number " show line numbers

let g:airline_symbols_ascii = 1

" Maps for natural navigation of long lines
nnoremap j gj
nnoremap k gk

let mapleader=','

" Visual dot map
:vnoremap . :norm.<CR>

" Make ,e open a file in the directory of the file currently being edited.
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

let g:LanguageClient_serverCommands = {
    	\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ }
