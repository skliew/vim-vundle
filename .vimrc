set nocompatible
syntax on

:colorscheme vividchalk
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
set grepprg=ack
" Turn off right-hand scroll-bar (toggle with CTRL+F7)
set guioptions-=r
set ff=unix
let mapleader=","
nmap <leader>b :FufBuffer<CR>
nmap <leader>e :BufExplorer<CR>
nmap <leader>f :Lid<CR><CR><CR>
"nmap <leader>f :FufFile<CR>
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>g :TlistToggle<CR>
"nmap <leader>r :Rgrep <C-R><C-W> *.p[ml]<CR>
"nmap <leader>r :RgrepLast <C-R><C-W><CR>
nmap <leader>r :grep -w <C-R><C-W><CR>

set cscopequickfix=s-,g-

set tabstop=2
set shiftwidth=2
set expandtab
set gfn=Monaco\ 10
set go-=m
set go-=T
set diffexpr=MyDiff()
set cino=>2s
set laststatus=2

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Bundle 'gmarik/vundle'

Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'The-NERD-tree'
Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'snipMate'
Bundle 'fugitive.vim'
"Bundle 'VimClojure'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'perl-support.vim'
"Bundle 'slimv.vim'
"Bundle 'jpalardy/vim-slime'
Bundle 'kana/vim-filetype-haskell'
Bundle 'comments.vim'
Bundle 'ragtag.vim'
Bundle 'cscope_macros.vim'

filetype plugin indent on
"let vimclojure#WantNailgun = 1
"let vimclojure#NailgunServer = "localhost.localdomain"
"
"let vimclojure#FuzzyIndent=1
"let vimclojure#HighlightBuiltins=1
"let vimclojure#HighlightContrib=1
"let vimclojure#DynamicHighlighting=1
"let vimclojure#ParenRainbow=1

set guifontwide=mingliu
