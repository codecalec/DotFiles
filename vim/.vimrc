"VIMRC.

call plug#begin('~/.vim/plugged')
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/targets.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'scrooloose/syntastic'
"Plug 'ycm-core/YouCompleteMe'
Plug 'psf/black', {'for': 'python'}
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'kamykn/spelunker.vim', {'for': 'tex'}
call plug#end()

source ~/.workman/vimrc

"!Basic
    set nocompatible
    filetype plugin on
    filetype indent on
    set number relativenumber
    set mouse=a

    if !has('nvim')
        set ttymouse=sgr
    endif

    command! Vimrc :vs $HOME/.vimrc

" Reduce mode switch delay
    set timeoutlen=1000
    set ttimeoutlen=5


" Splits
    set splitbelow splitright

" Cursor Speed
    set ttyfast

" Indentation
    set expandtab
    set shiftwidth=4
    set softtabstop=4

" Copy Pasting
    set clipboard+=unnamedplus

" Enable Autocompletion
    set wildmode=longest,list,full

" Automatically deletes all trailing whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e

 :

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

" Unnamed register paste shortcut
    nmap <leader>p "+p

" Spellchecking
    map <leader>s :setlocal spell! spelllang=en_gb<CR>


" Colours and Fonts
    syntax enable
    set encoding=utf-8
    let g:gruvbox_italic=1
    colorscheme gruvbox
    set background=dark    " Setting dark mode

"lightline
    set laststatus=2
    let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
" Map key to toggle NERDTree
    map <leader>n :NERDTreeToggle<CR>

" Close NERDTree with vim
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Latex
" Set tex flavour
    "set grepprg=grep\ -nH\ $*
    let g:tex_flavor = "latex"
    au FileType tex let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

    let g:Tex_ViewRule_pdf = 'zathura'
    let g:Tex_DefaultTargetFormat = 'pdf'
    autocmd FileType tex :map <F3> :w !detex \| wc -w<CR>

"Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_checkers=['flake8']
    let g:syntastic_tex_lacheck_quiet_messages = { 'regex': '\VYou should enclose the previous parenthesis with' }

" Formatting
    let g:black_linelength = 79
    autocmd BufWritePre *.py execute ':Black'
    nnoremap <leader>f :Black<CR>
