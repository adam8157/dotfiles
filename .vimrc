""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""

" Be IMproved
set nocompatible

" Set backspace
set backspace=eol,start,indent

" Lines folding
set foldenable
set foldnestmax=1
set foldmethod=syntax

" Enable filetypes
filetype plugin indent on

" Set fileencodings
set fileencodings=ucs-bom,utf-8,gbk,big5

" Set complete options
set completeopt=longest,menu

" Set non-linewise display
set display=lastline

" Use absolute paths in sessions
set sessionoptions-=curdir

""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'autoload_cscope.vim'
Bundle 'bufexplorer.zip'
Bundle 'echofunc.vim'
Bundle 'grep.vim'
Bundle 'OmniCppComplete'
Bundle 'snipMate'
Bundle 'SuperTab-continued.'
Bundle 'taglist.vim'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable backup
set backup

" Set backup directory
set backupdir=~/.vim/backup

" Set swap file directory
set directory=~/.vim/swap,/tmp

" Keep more backups for one file
autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")

""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
colorscheme desert

" Enable syntax highlight
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""

" Show ruler
set ruler

" Dynamic title
set title

" Turn on Wild menu
set wildmenu

" Display line number
set number

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable magic matching
set magic

" Show matching bracets
set showmatch

" Highlight search things
set hlsearch

" Ignore case when searching
set smartcase
set ignorecase

" Incremental match when searching
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto indent
set autoindent

" Smart indet
set smartindent

" Use hard tabs
set tabstop=8
set noexpandtab
set shiftwidth=8

" Break long lines
"set textwidth=78

" Set auto-formating
set formatoptions+=mM

" Config C-indenting
set cinoptions=:0,l1,t0,g0

" set textwidth for mail
autocmd FileType mail set textwidth=72

" Use soft tabs for python
autocmd FileType python set et sta ts=4 sw=4

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

" Use my own cscope mappings
let autocscope_menus=0

" Auto change the root directory
let NERDTreeChDirMode=2

""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags
""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto finding
set tags=tags;

" Sort by name
let Tlist_Sort_Type="name"

" Use right window
let Tlist_Use_Right_Window=1

" Enable auto update
let Tlist_Auto_Update=1

" Set compart format
let Tlist_Compart_Format=1

" Set exit by window
let Tlist_Exit_OnlyWindow=1

" Disable fold column
let Tlist_Enable_Fold_Column=0

""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""

" Use both cscope and ctag
set cscopetag

" Show msg when cscope db added
set cscopeverbose

" Use tags for definition search first
set cscopetagorder=1

" Use quickfix window to show cscope results
set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Cscope mappings
nnoremap <C-w>\ :scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

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
nnoremap <F5> :w<CR>:make!<CR>
nnoremap <F6> :w<CR>:make! %< CC=gcc CFLAGS="-Wall -g -O2"<CR>:!./%<<CR>

" Quickfix window
nnoremap <silent> <F7> :botright copen<CR>
nnoremap <silent> <F8> :cclose<CR>

" NERDTreeToggle
nnoremap <silent> <F9> :NERDTreeToggle<CR>

" Toggle display line number
nnoremap <silent> <F10> :set number!<CR>

" Use <space> to toggle fold
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Use xsel to access the X clipboard
if $DISPLAY != '' && executable('xsel')
	nnoremap <silent> "*y :'[,']w !xsel -i -p -l /dev/null<CR>
	nnoremap <silent> "*p :r!xsel -p<CR>
	nnoremap <silent> "+y :'[,']w !xsel -i -b -l /dev/null<CR>
	nnoremap <silent> "+p :r!xsel -b<CR>
endif
