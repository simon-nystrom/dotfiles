call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
call plug#end()

set autoindent
set expandtab

filetype indent on
filetype plugin on

set background=dark
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

highlight LineNr ctermfg=DarkGrey 
highlight PmenuSel ctermfg=Yellow 

map <C-s> :w<CR>
map <C-p> :Files<CR>
