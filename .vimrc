call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'w0rp/ale'
Plug 'junegunn/fzf.vim'
call plug#end()

set autoindent
set expandtab

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

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

map <D-p> :Files<CR>
