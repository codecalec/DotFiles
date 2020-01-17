"VIMRC.

call plug#begin('~/.vim/plugged')
Plug 'sainnhe/edge'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'davidhalter/jedi-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'plasticboy/vim-markdown'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

"!Basic
    set nocompatible
    filetype plugin on
    filetype indent on
    set number relativenumber
    set mouse=a
    set encoding=utf-8

" Indentation
    set expandtab
    set shiftwidth=4
    set softtabstop=4

" Copy Pasting
    :set clipboard=unnamed

" Enable Autocompletion
    set wildmode=longest,list,full

" Automatically deletes all trailing whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e

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

" Spellchecking
    map <leader>s :setlocal spell! spelllang=en_gb<CR>


" air-line
    let g:airline_powerline_fonts = 1
    let g:airline_theme = "fairyfloss"
    let g:airline_right_sep = ""


" Colors and Fonts
    let g:edge_transparent_background = 1
    let g:edge_style = 'neon'
    colorscheme slate

    syntax enable
    set encoding=utf-8

" Open NERDTree automatically
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Map key to toggle NERDTree
    map <leader>n :NERDTreeToggle<CR>

" Close NERDTree with vim
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Python
" Run Python script
    autocmd FileType python map E <Esc>:w<CR>:!clear;python %<CR>

"Latex
" Set tex flavour
    "set grepprg=grep\ -nH\ $*
    "let g:tex_flavor = "latex"
    au FileType tex let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

    let g:Tex_ViewRule_pdf = 'zathura'
    let g:Tex_DefaultTargetFormat = 'pdf'

"Syntastic
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_checkers=['mypy']

"LimeLight
    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240

    " Color name (:help gui-colors) or RGB color
    let g:limelight_conceal_guifg = 'DarkGray'
    let g:limelight_conceal_guifg = '#777777'
