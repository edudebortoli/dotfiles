set nocompatible
set showmatch

" Ignore case when searching
set ignorecase

" Can paste with middle mouse click
set mouse=v

" Highlight Search
set hlsearch
set incsearch
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent

" Auto Ident
set ai
" Smart Ident
set si

" No wrap lines
set nowrap

" Show line number
set number relativenumber
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set smarttab
set wildmode=longest,list
set cc=80
filetype plugin on
filetype plugin indent on
set mouse=a
set clipboard=unnamedplus

" Open new split panes on right and below
set splitright
set splitbelow

" Fast scroll
set ttyfast 

" Find files into subfolders
set path+=**

" Add asterisks in block comments
set formatoptions+=r

" set spell
" set noswapfile
" set backupdir=~/.cache/vim

" Plugins
runtime ./plug.vim

source $HOME/.config/nvim/plug.vim

" Theme setup
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " neoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif

" Move lines or block (alt+j/k) I & V Modes
inoremap <A-j> <ESC>:m .+1<CR>==gi
inoremap <A-k> <ESC>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Move split panes to N Mode
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" Move between panes N mode
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l



