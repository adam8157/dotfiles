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

" Use absolute paths in sessions
set sessionoptions-=curdir

" Set current working directory automatically
" autocmd BufEnter * silent! lcd %:p:h

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable backup
set backup

" Set backup directory
set backupdir=~/.vim/backup
if !isdirectory($HOME . "/.vim/backup")
	call mkdir($HOME . "/.vim/backup", "p", 0700)
endif

" Set swap file directory
set directory=~/.vim/swap,/tmp
if !isdirectory($HOME . "/.vim/swap")
	call mkdir($HOME . "/.vim/swap", "p", 0700)
endif

" Keep more backups for one file
autocmd BufWritePre * let &backupext = strftime(".%y%m%d%H%M")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
colorscheme desert

" Enable syntax highlight
syntax on

" Set the highlight color for search
highlight Search term=reverse ctermfg=black ctermbg=yellow guifg=black guibg=yellow

" Set the highlight color for special keys like tabs and spaces
highlight SpecialKey ctermfg=darkgray guifg=darkgray

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

" Set the strings to use in the 'list' mode
set listchars=tab:>-,trail:·,extends:>,precedes:<,space:·

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
set cinoptions=:0,l1,t0,g0,(0

" set textwidth for mail
autocmd FileType mail set textwidth=72

" Use soft tabs for python
autocmd FileType python set expandtab shiftwidth=4 softtabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source code tagging
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autoload tags
set tags=tags;

" Use GLOBAL tags
set cscopeprg=gtags-cscope

" Use both GLOBAL and ctags
set cscopetag

" Search GLOBAL database first
set cscopetagorder=0

" Use quickfix window to show search results
set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-

" Find the database file and load it automatically
function! LoadDatabase()
	let db = findfile("GTAGS", ".;")
	if (!empty(db))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db
		set cscopeverbose
	endif
endfunction
autocmd BufEnter *.c,*.cc,*.cpp,*.h call LoadDatabase()

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
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Fuzzy finder
nnoremap <Leader>f :FzfFiles<CR>
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>m :FzfHistory<CR>
nnoremap <Leader>g :FzfGitFiles<CR>

" GLOBAL key mappings
nnoremap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

" Display lines upward and downward
nnoremap <Up> gk
nnoremap <Down> gj

" Tagbar toggle
nnoremap <silent> <F2> :TagbarToggle<CR>

" Searching tool
nnoremap <F3> :Ag! <C-R>=expand("<cword>")<CR> ./

" Paste toggle
set pastetoggle=<F4>

" Save & Make
nnoremap <F5> :w<CR>:make!<CR>

" Save & Run
au FileType go nn <F6> :w<CR>:!go run %<CR>
au FileType python nn <F6> :w<CR>:!python %<CR>
au FileType c nn <F6> :w<CR>:make! %< CC=gcc CFLAGS="-g -Wall"<CR>:!./%<<CR>

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

" Fzf command prefix
let fzf_command_prefix = 'Fzf'

" Vim-go plugin settings
let go_fmt_fail_silently = 1
let go_highlight_functions = 1
let go_highlight_methods = 1
let go_highlight_structs = 1
let go_highlight_operators = 1
let go_highlight_build_constraints = 1

" Add extra spaces when (un)commenting
let NERDSpaceDelims = 1

" Use context to decide completion type
let SuperTabDefaultCompletionType = "context"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'vim-scripts/OmniCppComplete'

Plug 'benjifisher/matchit.zip'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'lilydjwg/fcitx.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'

Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'nathanaelkane/vim-indent-guides', { 'for': 'python' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()
