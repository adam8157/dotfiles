"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set backspace
set backspace=eol,start,indent

" Lines folding
set foldenable
set foldnestmax=1
set foldmethod=syntax

" Turn backup on
set backup

" Set fileencodings
set fileencodings=ucs-bom,utf-8,gbk

" Set backup directory
set backupdir=$HOME/.vim/backup

" Set non-linewise display
set display=lastline

" Disable VI compatible mode
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
colorscheme desert

" Enable syntax highlight
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show ruler
set ruler

" Turn on Wild menu
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable magic matching
set magic

" Show matching bracets
set showmatch

" Highlight search things
set hlsearch

" Ignore case when searching
set ignorecase
set smartcase

" Incremental match when searching
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto indent
set autoindent

" Smart indet
set smartindent

" C-style indeting
set cindent

" Set tabstop width
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Set <BS> delete fake tabs
set smarttab

" Insert spaces instead of real tabs
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto finding
set tags=tags;
set autochdir

" Sort by name
let Tlist_Sort_Type = "name"

" Use right window
let Tlist_Use_Right_Window = 1

" Enable auto update
let Tlist_Auto_Update = 1

" Set compart format
let Tlist_Compart_Format = 1

" Set exit by window
let Tlist_Exit_OnlyWindow = 1

" Disable auto close
let Tlist_File_Fold_Auto_Close = 0

" Disable fold column
let Tlist_Enable_Fold_Column = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab navigation
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap gf <C-W>gf

" Move among windows
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k

" Set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj

" Toggle Tlist
nnoremap <silent> <F2> :TlistToggle<CR>:TlistUpdate<CR>

" Grep search tools
nnoremap <F3> :Rgrep<CR>

" Paste toggle
set pastetoggle=<F4>

" Save & Make 
nnoremap <F5> :w<CR>:make<CR>
nnoremap <F6> :w<CR>:make %< CC=gcc CFLAGS="-Wall -g -O2"<CR>:!./%<<CR>
nnoremap <F7> :botright copen<CR>
nnoremap <F8> :cclose<CR>

" Use <space> to toggle fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
