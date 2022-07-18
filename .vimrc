syntax enable
"set termguicolors
colors onedark
"colors monokai_pro

set switchbuf=usetab
set encoding=utf-8
set foldmethod=syntax
set nofoldenable
set hlsearch
set ignorecase
set softtabstop=4
set shiftwidth=4
autocmd FileType make setlocal noexpandtab
se nu rnu
set smartindent
set tabstop=4
set expandtab

map <silent> <C-c> :IndentLinesToggle<CR>
map <silent> <C-m> :se nu!<CR>:se rnu!<CR>
map <silent> <C-s> :w<CR>
map <silent> <C-q> :q<CR>
map <silent> <C-o> :vsp ~/.vimrc<CR>
nmap <silent> <F10> :tabn<CR>
nmap <silent> <F9> :tabp<CR>
nmap <silent> <C-p> :NERDTreeToggle<CR>
nmap <silent> <Up> :resize -5<CR>
nmap <silent> <Down> :resize +5<CR>
nmap <silent> <Left> :vertical resize -5<CR>
nmap <silent> <Right> :vertical resize +5<CR>
nmap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

cnoreabbrev install PlugInstall
cnoreabbrev status PlugStatus
cnoreabbrev update PlugUpdate
cnoreabbrev euckr :e ++enc=euc-kr

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
"hi Comment guifg=#afb0ff ctermfg=LightCyan
set t_Co=256
set cursorline
hi cursorline term=none cterm=none guibg=#303000 ctermbg=234

let g:airline_theme='cool'
"let g:airline_theme='cobalt2'

" indent line settings
let g:indentLine_color_term = 20
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_setConceal = 0

" NERDTree settings
let NERDTreeShowHidden=1

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
"Plug 'Valloric/YouCompleteMe'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'dart-lang/dart-vim-plugin'
Plug 'fidian/hexmode'
Plug 'tpope/vim-eunuch'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
call plug#end()
