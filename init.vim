set shell=/bin/bash

let mapleader = "\<Space>"
set nocompatible
filetype off

" Plugins 
call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
call plug#end()

filetype plugin indent on
set autoindent
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden

" set nowrap
set nojoinspaces

" tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" get syntax
syntax on

" wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" proper search
set incsearch
set ignorecase
set smartcase
" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault
set hlsearch

"Press space to highlight current word
nnoremap <silent><space> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" search results centered
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" some magic
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" shortcuts
" ; as :
nnoremap ; :

" save
nnoremap <leader>w :w<CR>

" Ctrl+c and Ctrl+j as Esc
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set nolist
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" Jump to start and end of line using the home row keys
map H ^
map L $

" Map moving between words
noremap <C-h> b
noremap <C-l> e

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" Sane splits
set splitright
set splitbelow

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" gui options
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set ruler
set laststatus=2
set relativenumber " Relative line numbers
set number " Also show current absolute line
" set colorcolumn=80 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.


let g:fzf_layout = { 'down': '~50%' }
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>f :Buffers<cr>
nnoremap <silent> <leader>r :Rg<cr>

" Colors
if !has('gui_running')
   set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

" let base16colorspace=256
set background=dark
colorscheme base16-summerfruit-dark
hi Normal ctermbg=NONE
