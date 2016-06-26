set nocompatible
syntax on

" Turn off useless toolbar
"set guioptions-=T

set t_Co=256
set hlsearch
set incsearch
set backspace=2
set ruler

set hidden
" Turn off menu bar (toggle with CTRL+F11)
set nobackup
set noswapfile
set grepprg=ag
" Turn off right-hand scroll-bar (toggle with CTRL+F7)
set guioptions-=r
set ff=unix

" Some shortcuts
let mapleader=","
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>f :Lid<CR><CR><CR>
nmap <leader>f :CtrlP<CR>
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>g :TlistToggle<CR>
nmap <leader>r :grep -w <C-R><C-W><CR>
nmap <leader>c :bp \| bd #<CR>

set cscopequickfix=s-,g-

set tabstop=2
set shiftwidth=2
set expandtab
set gfn=Monaco\ 10
set go-=m
set go-=T
set cino=>2s
set laststatus=2

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Plugin 'gmarik/Vundle.vim'

"Plugin 'kien/ctrlp.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'L9'
Plugin 'The-NERD-tree'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'snipMate'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'perl-support.vim'
Plugin 'kana/vim-filetype-haskell'
Plugin 'jnwhiteh/vim-golang'
Plugin 'comments.vim'
Plugin 'ragtag.vim'
Plugin 'cscope_macros.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'wting/rust.vim'
Plugin 'elzr/vim-json'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/syntastic'

" Color schemes
Plugin 'croaker/mustang-vim'
Plugin 'twerth/ir_black'

filetype plugin indent on

set guifontwide=mingliu
let g:html_indent_inctags = "body,html,head,p,tbody"
let g:vim_json_syntax_conceal = 0
let g:ctrlp_working_path_mode = 'w'

let g:syntastic_javascript_checkers = ['eslint']

autocmd Filetype javascript setlocal sw=4

:colorscheme grb256

set wildmenu
set wildmode=list:longest,full
