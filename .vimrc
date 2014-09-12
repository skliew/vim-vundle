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
set grepprg=ag
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
set cino=>2s
set laststatus=2

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Plugin 'gmarik/Vundle.vim'

Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'The-NERD-tree'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'snipMate'
Plugin 'fugitive.vim'
"Plugin 'VimClojure'
Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-classpath'
Plugin 'guns/vim-clojure-static'
Plugin 'perl-support.vim'
"Plugin 'slimv.vim'
"Plugin 'jpalardy/vim-slime'
Plugin 'kana/vim-filetype-haskell'
Plugin 'jnwhiteh/vim-golang'
Plugin 'comments.vim'
Plugin 'ragtag.vim'
Plugin 'cscope_macros.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

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
let g:html_indent_inctags = "body,html,head,p,tbody"

