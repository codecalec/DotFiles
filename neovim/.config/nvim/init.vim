"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

call plug#begin(stdpath('data') . '/plugged')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/targets.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'scrooloose/syntastic'
Plug 'psf/black', {'for': 'python'}
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'kamykn/spelunker.vim', {'for': 'tex'}
call plug#end()

source ~/.workman/vimrc

"!Basic
	set number
	set mouse=a

" Fix tabs
	set tabstop=4
	set shiftwidth=4
	set expandtab

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Allows persistent undo
	set undofile

" Unnamed register paste shortcut
	nmap <leader>p "+p

" Spellchecking
	map <leader>s :setlocal spell! spelllang=en_gb<CR>

" Colours and Fonts
    if (has("termguicolors"))
        set termguicolors
    endif
    let g:gruvbox_italic=1
	colorscheme gruvbox

"lightline
	let g:lightline = {
	\ 'colorscheme': 'seoul256',
	\ }

"Latex
	let g:tex_flavor = "latex"
	au FileType tex let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
	let g:vimtex_view_method = 'zathura'

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
