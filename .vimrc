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
nmap <leader>r :MyGrep -w <cword><CR>
nmap <leader>c :bp \| bd #<CR>

nmap <leader>p :let @" = expand("%")<CR>

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
Plugin 'tpope/vim-commentary'
Plugin 'ragtag.vim'
Plugin 'cscope_macros.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'wting/rust.vim'
Plugin 'elzr/vim-json'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-syntastic/syntastic'
Plugin 'matchit.zip'
Plugin 'udalov/kotlin-vim'
Plugin 'hzchirs/vim-material'
Plugin 'chriskempson/base16-vim'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'leafgarland/typescript-vim'
Plugin 'fsharp/vim-fsharp'
Plugin 'OmniSharp/omnisharp-vim'

" Color schemes
Plugin 'croaker/mustang-vim'
Plugin 'twerth/ir_black'
Plugin 'nanotech/jellybeans.vim'

filetype plugin indent on
set nofoldenable
imap <C-c><C-o> <C-x><C-o>

set guifontwide=mingliu
let g:html_indent_inctags = "body,html,head,p,tbody"
let g:vim_json_syntax_conceal = 0
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = 'node_modules'

let g:syntastic_javascript_checkers = ['eslint']

let b:syntastic_javascript_eslint_exec = './node_modules/eslint/bin/eslint.js'

autocmd Filetype javascript setlocal sw=4

let g:jellybeans_overrides = {
      \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
      \}
:colorscheme jellybeans

function MyGrepFunc(...)
  silent execute 'grep ' . join(a:000, ' ')
  redraw!
endfunction

command -nargs=* MyGrep call MyGrepFunc(<f-args>)

set wildmenu
set wildmode=list:longest,full

let g:syntastic_cs_checkers = ['code_checker']
autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
