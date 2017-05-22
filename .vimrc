set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'oscarh/vimerl'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'altercation/vim-colors-solarized'
Plug 'rodjek/vim-puppet'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'fatih/vim-go'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'google/vim-ft-bzl'
Plug 'rust-lang/rust.vim'
Plug 'fugue/ludwig-vim'
Plug 'itchyny/lightline.vim'
Plug 'ervandew/supertab'
Plug 'yggdroot/indentline'
Plug 'roxma/vim-paste-easy'
Plug 'andrewradev/splitjoin.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ekalinin/Dockerfile.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'racer-rust/vim-racer'

call plug#end()
call glaive#Install()

Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="javafmt"

let g:go_fmt_command = "goimports"
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

syntax enable

set background=dark
colorscheme solarized

" Load plugins.
if has("autocmd")
    filetype plugin indent on
endif

set go-=m                 " Hide menu (gvim).
set go-=T                 " Hide toolbar (gvim).
set nu                    " Line numbers.
set hidden                " Hide buffers when switching rather than closing them.
set expandtab
set autoindent            " Automatically indent.
set smartindent
set copyindent            " Copy the previous line's indenting.
set tabstop=4             " Show tabs as 4 spaces
set showmatch             " Show matching parenthesis.
set hlsearch              " Highlight search terms.
set history=1000          " Commands and search history.
set undolevels=1000       " Lots of undo levels.
set wildmenu              " Wildmenu rocks.
set shiftround            " always round indents to multiple of shiftwidth.
set backup                " Get rid of the .swp files from my working dir.
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set textwidth=80          " The maximum number of characters a line should be.
set fo+=t                 " Automatically wrap long lines
set noswapfile            " Don't bother with swap files.
set ignorecase
set smartcase
set pastetoggle=,p        " Toggle paste mode, which allows you to paste as-is
set laststatus=2
set termencoding=utf-8
set encoding=utf-8
set completeopt=menu,menuone

" Session management
let g:session_default_name = getcwd()
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_autosave_periodic = 'yes'

function SaveAndCloseSession()
    SaveSession
    CloseSession
endfunction

autocmd! VimLeave * call SaveAndCloseSession()

" Map my leader key
let mapleader=','

" Tabular mappings
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Visual dot map
:vnoremap . :norm.<CR>

" Set the formatting program to par
if executable("par")
    set formatprg=par\ -w80\ -r\ -j
endif

" 80 columns marker
if exists('+colorcolumn')
  set colorcolumn=+1
endif

" Spell checking on text files.
if v:version >= 700
    " Enable spell check for text files.
    autocmd! BufNewFile,BufRead *.txt,*.md,*.markdown,*.mdown,*.tex setlocal spell spelllang=en_gb
endif

" Syntastic settings.
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['tex', 'java'] }
let g:syntastic_c_compiler = 'clang'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '`llvm-config --cppflags --ldflags --libs core`'

let g:racer_experimental_completer = 1


" Some time savers.
command! WQ wq
command! Wq wq
command! W w
command! Q q

" This abbreviation replaces the :q command with :qall.
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'qall' : 'q')<CR>

" Strip trailing whitespace before writing buffer to file.
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Maps for window resizing
noremap <silent> <Left> <C-w><
noremap <silent> <Down> <C-W>-
noremap <silent> <Up> <C-W>+
noremap <silent> <Right> <C-w>>

" Maps for natural navigation of long lines
nnoremap j gj
nnoremap k gk

" Source a given file or fail out.
function! LoadFile(filename)
    let FILE=expand(a:filename)
    if filereadable(FILE)
        exe "source " FILE
    else
        " echo "Can't source " FILE
    endif
endfunction

" Stop screen trying to hijack .S files.
let vimrplugin_screenplugin = 0

" Syntax highlight in codeblocks in markdown
let g:markdown_fenced_languages = ['ruby', 'vim', 'c']

" Make ,e open a file in the directory of the file currently being edited.
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Load the .vimrc.local file if it exists.
exec LoadFile("~/.vimrc.local")
