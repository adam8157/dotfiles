"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set backspace
set backspace=eol,start,indent

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

" Turn on WiLd menu
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

" Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

" Toggle Tlist
noremap <F2> :Tlist<CR>

" TlistUpdate
noremap <F3> :TlistUpdate<CR>

" Paste toggle
set pastetoggle=<F4>

" C's compile and run
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  exec "!gcc -Wall -g % -o %<"
  exec "! ./%<"
endfunc

" C++'s compile and run
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
  exec "w"
  exec "!g++ -Wall -g % -o %<"
  exec "! ./%<"
endfunc

" Open current directory
map <F7> :e .<CR>

" Use <space> to toggle fold
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj
