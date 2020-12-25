syntax enable

colorscheme desert

map ; :

set number

"-----------------search----------------"
set hlsearch

map <CR> :nohlsearch<CR>

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"----------WINDOW MANAGEMENT-------"
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-h> <C-w><C-h>
nmap <C-l> <C-w><C-l>


"--------mapping plug----"
nmap ,e :NERDTreeToggle<CR>

"---------VIM PLUG--------"
call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
		nmap <C-p> :Files<CR>
		nmap <C-g> :GFiles<CR>
		nmap <C-b> :Buffers<CR>
	Plug 'dense-analysis/ale'
	Plug 'sheerun/vim-polyglot'
	Plug 'rust-lang/rust.vim'
		let g:rustfmt_autosave = 1
call plug#end()
