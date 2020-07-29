call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
call plug#end()

set background=dark
let g:gruvbox_contrast_dark = 'dark'
colorscheme gruvbox

set autoindent
set expandtab
set hidden

filetype indent on
filetype plugin on

set shiftround
set shiftwidth=4
set smarttab
set tabstop=4

set hlsearch
set incsearch
set ignorecase
set smartcase

set lazyredraw

set display+=lastline
set linebreak
set encoding=utf-8
set scrolloff=1

syntax enable
set wrap
set laststatus=2
set ruler
set wildmenu
set cursorline

set number relativenumber
set title

let g:netrw_liststyle = 3

map <C-s> :w<CR>
map <C-p> :GFiles<CR>

let g:airline_theme='base16_gruvbox_dark_hard'
