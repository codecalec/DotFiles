" VIMRC.
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'dylanaraps/wal'
call plug#end()

colorscheme wal

let mapleader = " "

"!Basic
	set nocompatible
       	filetype plugin on
	filetype indent on
	set number relativenumber

" Fast saving
	nmap <leader>w :w!<cr>

" Copy Pasting
	:set clipboard=unnamed

" Enable Autocompletion
	set wildmode=longest,list,full

" Configure backspace so it acts as it should act
	set backspace=eol,start,indent
	set whichwrap+=<,>,h,l

" Ignore case when searching
	set ignorecase

" When searching try to be smart about cases 
	set smartcase

" Highlight search results
	set hlsearch

" Makes search act like search in modern browsers
	set incsearch 

" Add a bit extra margin to the left
	set foldcolumn=1

" Spellchecking
	map <F6> :setlocal spell! spelllang=en_gb<CR>

" Colors and Fonts 
	syntax enable	
	set encoding=utf-8

" Open NERDTree automatically 
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Map key to toggle NERDTree
	map <C-n> :NERDTreeToggle<CR>

" Close NERDTree with vim
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Python
" Run Python script	
	autocmd FileType python map E <Esc>:w<CR>:!clear;python %<CR>
