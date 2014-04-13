""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Set wild menu & mode
set wildmenu
set wildmode=longest:full,full

" Set key codes timeout
set ttimeoutlen=100

" Auto change current directory
set autochdir

" Use absolute paths in sessions
set sessionoptions-=curdir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable backup
set backup

" Set backup directory
set backupdir=~/.vim/backup

" Set swap file directory
set directory=~/.vim/swap,/tmp

" Keep more backups for one file
autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
colorscheme desert

" Enable syntax highlight
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show ruler
set ruler

" Dynamic title
set title

" Display line number
set number

" Always have a status line
set laststatus=2

" Allow to display incomplete line
set display=lastline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
autocmd FileType python set et sw=4 sts=4

" Use extension to set filetype
autocmd BufNewFile,BufRead *.md set filetype=markdown

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags & Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto finding
set tags=tags;

" Use both cscope and ctag
set cscopetag

" Show msg when cscope db added
set cscopeverbose

" Use tags for definition search first
set cscopetagorder=1

" Use quickfix window to show cscope results
set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab navigation
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap gf <C-W>gf

" Move among windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

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

" Display lines upward and downward
noremap <Up> gk
noremap <Down> gj

" Tagbar toggle
nnoremap <silent> <F2> :TagbarToggle<CR>

" Searching tool
nnoremap <F3> :Rgrep<CR>

" Paste toggle
set pastetoggle=<F4>

" Save & Make 
nnoremap <F5> :w<CR>:make!<CR>
nnoremap <F6> :w<CR>:make! %< CC=gcc CFLAGS="-g -Wall"<CR>:!./%<<CR>

" Quickfix window
nnoremap <silent> <F7> :botright copen<CR>
nnoremap <silent> <F8> :cclose<CR>

" NERDTree toggle
nnoremap <silent> <F9> :NERDTreeToggle<CR>

" Line numbers toggle
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set Tagbar width
let tagbar_width = 32

" Use my own cscope mappings
let autocscope_menus = 0

" Use context to decide completion type
let SuperTabDefaultCompletionType = "context"

" Vundle plugin manager
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'

Bundle 'Align'
Bundle 'autoload_cscope.vim'
Bundle 'bufexplorer.zip'
Bundle 'ctrlp.vim'
Bundle 'echofunc.vim'
Bundle 'fcitx.vim'
Bundle 'grep.vim'
Bundle 'Indent-Guides'
Bundle 'Markdown'
Bundle 'matchit.zip'
Bundle 'snipMate'
Bundle 'SuperTab--Van-Dewoestine'
Bundle 'Tagbar'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'

filetype plugin indent on
