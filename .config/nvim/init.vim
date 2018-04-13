call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab'
Plug 'iCyMind/NeoSolarized'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sebastianmarkow/deoplete-rust'

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

"let g:deoplete#disable_auto_complete = 1
"inoremap <silent><expr> <TAB>
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ deoplete#mappings#manual_complete()
"function! s:check_back_space() abort "{{{
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}

let g:SuperTabDefaultCompletionType = "<C-n>"

" Make ,e open a file in the directory of the file currently being edited.
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary=systemlist("which racer")[0]
let g:deoplete#sources#rust#rust_source_path=systemlist("rustc --print sysroot")[0] . '/lib/rustlib/src/rust/src/'
let g:deoplete#sources#rust#show_duplicates=0
