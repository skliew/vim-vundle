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
" set grepprg=ag\ --vimgrep
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
nmap <leader>j :%!python -m json.tool<CR>
nmap <leader>k :%!jq -c .<CR>
" nmap <leader>j :%!-print-json<CR>

nmap <leader>p :let @" = expand("%")<CR>

set cscopequickfix=s-,g-

set tabstop=2
set shiftwidth=2
set expandtab
set gfn=Monaco\ 10
set go-=m
set go-=T
set cino=>2s,:2s,=2s
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
Plugin 'scrooloose/nerdtree'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'snipMate'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
" Plugin 'perl-support.vim'
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
Plugin 'Quramy/tsuquyomi'

" Color schemes
Plugin 'croaker/mustang-vim'
Plugin 'twerth/ir_black'
Plugin 'nanotech/jellybeans.vim'

Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
filetype plugin indent on
set nofoldenable
imap <C-c><C-o> <C-x><C-o>

set guifontwide=mingliu
let g:html_indent_inctags = "body,html,head,p,tbody"
let g:vim_json_syntax_conceal = 0
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = './node_modules\|./acceptance_tests'

let g:syntastic_javascript_checkers = ['eslint']

let b:syntastic_javascript_eslint_exec = './node_modules/eslint/bin/eslint.js'

autocmd Filetype javascript setlocal sw=4

" let g:jellybeans_overrides = {
"       \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
"       \}
" :colorscheme jellybeans
:colorscheme grb256
" :colorscheme atom-dark-256

function MyGrepFunc(...)
  silent execute 'grep ' . join(a:000, ' ')
  redraw!
endfunction

command -nargs=* MyGrep call MyGrepFunc(<f-args>)

set wildmenu
set wildmode=list:longest,full

set diffopt=vertical
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
let g:fsharp_map_keys = 0 

let g:syntastic_cs_checkers = ['code_checker']
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_autoselect_existing_sln = 1
" let g:OmniSharp_typeLookupInPreview = 1
" autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
" let g:OmniSharp_proc_debug=1
" set clipboard+=unnamed
set enc=utf8

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  " setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the
  " server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
