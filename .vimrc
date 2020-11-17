execute pathogen#infect()
" basics
set fileformats=unix
set t_Co=256            " set 256 color
set nocompatible        " use Vim defaults
set mouse=a             " make sure mouse is used in all cases.
colorscheme molokai     " define syntax color scheme
set complete+=k         " enable dictionary completion
set completeopt+=longest
set backspace=2         " full backspacing capabilities
set history=100         " 100 lines of command line history
set showmode            " show mode at bottom of screen
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down
set cmdheight=2         " set the command height
set showmatch           " show matching brackets (),{},[]
set mat=5               " show matching brackets for 0.5 seconds

" wrap like other editors
set wrap                " word wrap
set textwidth=0         " 
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

" tabs and indenting
set tabstop=2           " a n-space tab width
set shiftwidth=2        " allows the use of < and > for VISUAL indenting
set softtabstop=2       " counts n spaces when DELETE or BCKSPCE is used

" searching
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search

" syntax highlighting
syntax on               " enable syntax highlighting

" show line numbers
set number

" plug-in settings
filetype plugin on
filetype indent on

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" neocomplete
let g:neocomplete#enable_at_startup = 1

" vim-airline
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" TagBar
nmap <leader>] :TagbarToggle<CR>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

let g:airline_powerline_fonts = 1
