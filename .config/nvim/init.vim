call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'mkropat/vim-ezguifont'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'fholgado/minibufexpl.vim'

call plug#end()

syntax on " Comment: for syntax highlighting
set number " Comment: for line number

set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

" Highlights tabspaces
"set invlist
"set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
"set showbreak=↪

"Allows switching buffers without saving each time
set hidden

" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Gundo plugin configuration
set undodir=~/.config/nvim/tmp/undo/
set undofile
set history=100
set undolevels=100

" Vim-session management settings
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "yes"

" Folding Stuffs
" set foldmethod=marker
set foldmethod=indent
set foldnestmax=2
set nofoldenable
set foldlevel=2
set tabpagemax=1000


" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

" Got backspace?
set backspace=2

"s Use + register (X Window clipboard) as unnamed register
"set clipboard=unnamedplus,autoselect 
set clipboard+=unnamedplus

" Search options
" And so is Artificial Intellegence!
set smartcase
set ignorecase

set hlsearch " Highlight things that we find with the search
set incsearch " Searches as you type
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
" Set off the other paren
highlight MatchParen ctermbg=4
" }}}

filetype off
filetype plugin indent on " Comment: for plugins

"not useful on windows and neovim since I started using vimplug
"call pathogen#infect()
"call pathogen#helptags()
map <F5> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

set colorcolumn=80
colorscheme gruvbox
syntax enable
set background=dark

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set laststatus=2

"Remapping keys
let mapleader=","
inoremap jk <ESC>

"Save works in both regular and insert modes 
map <leader>s <ESC>:w<Enter>
map! <leader>s <ESC>:w<Enter> 

" j and k motions now work on wrapped single lines
nmap j gj
nmap k gk

"Disabling arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Remove search highlighting 
nnoremap <leader>m :nohlsearch<CR>
"MiniBufferExplorer
" If you like control + vim direction key to navigate
" windows then perform the remapping
"
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

" If you like <C-TAB> and <C-S-TAB> to switch buffers
" in the current window then perform the remapping
" Only seems to work in gVim
let g:miniBufExplMapCTabSwitchBufs = 1
noremap <C-TAB>   <Esc>:MBEbn<CR>
noremap <C-S-TAB> <Esc>:MBEbp<CR>

"NERDTree
nmap <leader>nt <Esc>:NERDTreeToggle<CR>
nmap <leader>nf <Esc>:NERDTreeFocus<CR>

"NerdCommenter
let g:NERDCreateDefaultMappings = 1

"vim-slime
"let g:slime_python_ipython = 1
"let g:slime_target = "tmux"

"YCM
"let g:ycm_python_binary_path = '/usr/bin/python3'
"let g:ycm_autocomplete_after_insertion=1

"Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"CtrlP
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
"set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.config/nvim/plugged/ctrlp.vim
"noremap <C-P> <Esc>:CtrlP G:\My\ Drive\gtd\<CR>
"
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"Airline
let g:airline_theme='powerlineish'

"Ezfont for windows. increase and dec font
"let g:ezguifont = 'Consolas:h14'
"nnoremap <C-=> :IncreaseFont<CR>
"nnoremap <C--> :DecreaseFont<CR>
"noremap <C-ScrollWheelUp> :IncreaseFont<CR>
"noremap <C-ScrollWheelDown> :DecreaseFont<CR>


"if vim.g.neovide then
    "set guifont=Source\ Code Pro:h14
"end

