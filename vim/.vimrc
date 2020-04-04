"VIMRC.

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-swap'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/targets.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'scrooloose/syntastic'
Plug 'ycm-core/YouCompleteMe'
Plug 'psf/black'
Plug 'joshdick/onedark.vim'
call plug#end()

"!Basic
    set nocompatible
    filetype plugin on
    filetype indent on
    set number relativenumber
    set mouse=a
    set encoding=utf-8
    command! Vimrc :vs $HOME/.vimrc


" Cursor Speed
    set ttyfast

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

" Allows persistent undo
    set undofile

" Spellchecking
    map <leader>s :setlocal spell! spelllang=en_gb<CR>

" Colors and Fonts
    syntax enable
    set encoding=utf-8
    colorscheme onedark
    if (empty($TMUX))
        if (has("termguicolors"))
            set termguicolors
        endif
    endif
    set background=dark
    highlight Normal guibg=NONE guifg=white

"" Airline
    "let g:airline_extensions = ['vimtex','ycm','syntastic']
    "let g:airline_powerline_fonts = 1
    "let g:airline_theme='simple'

"lightline
    set laststatus=2
    let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }
" Map key to toggle NERDTree
    map <leader>n :NERDTreeToggle<CR>

" Close NERDTree with vim
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Latex
" Set tex flavour
    "set grepprg=grep\ -nH\ $*
    "let g:tex_flavor = "latex"
    au FileType tex let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

    let g:Tex_ViewRule_pdf = 'zathura'
    let g:Tex_DefaultTargetFormat = 'pdf'

"Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_checkers=['flake8']

" Formatting

    let g:black_linelength = 79
    autocmd BufWritePre *.py execute ':Black'
    nnoremap <leader>f :Black<CR>

"Fix Mouse with Alacritty
set ttymouse=sgr


