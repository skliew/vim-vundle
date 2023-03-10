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
set grepprg=ag\ --vimgrep
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

set fileencodings=utf-8,euc-jp

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
" Plugin 'perl-support.vim'
" Plugin 'kana/vim-filetype-haskell'
Plugin 'jnwhiteh/vim-golang'
Plugin 'tpope/vim-commentary'
Plugin 'ragtag.vim'
Plugin 'cscope_macros.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'rust-lang/rust.vim'
Plugin 'elzr/vim-json'
Plugin 'vim-syntastic/syntastic'
Plugin 'matchit.zip'
Plugin 'udalov/kotlin-vim'
Plugin 'hzchirs/vim-material'
Plugin 'chriskempson/base16-vim'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'leafgarland/typescript-vim'
Plugin 'PhilT/vim-fsharp'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'neovimhaskell/haskell-vim'

" Color schemes
Plugin 'croaker/mustang-vim'
Plugin 'twerth/ir_black'
Plugin 'nanotech/jellybeans.vim'

Plugin 'zah/nim.vim'

Plugin 'andy-morris/happy.vim'

filetype plugin indent on
set nofoldenable
imap <C-c><C-o> <C-x><C-o>

set guifontwide=mingliu
let g:html_indent_inctags = "body,html,head,p,tbody"
let g:vim_json_syntax_conceal = 0
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = './node_modules\|./acceptance_tests\|./target\|./tests'

let g:syntastic_javascript_checkers = ['eslint']

let b:syntastic_javascript_eslint_exec = './node_modules/eslint/bin/eslint.js'

autocmd Filetype javascript setlocal sw=4
autocmd Filetype fsharp set commentstring=//%s

" let g:jellybeans_overrides = {
"       \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
"       \}
" :colorscheme jellybeans
:colorscheme ir_black
" :colorscheme grb256
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
let g:OmniSharp_loglevel = "debug"
let g:OmniSharp_autoselect_existing_sln = 1
let g:syntastic_ocaml_checkers = ['merlin']
" let g:OmniSharp_typeLookupInPreview = 1
" autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
" let g:OmniSharp_proc_debug=1
" set clipboard+=unnamed
set enc=utf8

set shortmess-=F

if !has('nvim')
function! s:on_lsp_buffer_enabled() abort
  " setlocal omnifunc=lsp#complete
  " setlocal signcolumn=yes
  " nmap <buffer> gd <plug>(lsp-definition)
  " nmap <buffer> <f2> <plug>(lsp-rename)
  " refer to doc to add more commands
endfunction
endif

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the
  " server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rust-analyzer'],
      \ }

set completeopt=menu
" Use <c-space> to trigger completion.
if has('nvim')
  Plugin 'neovim/nvim-lspconfig'
endif

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
autocmd FileType fsharp setlocal commentstring=(*%s*)

function VimBufCommand()
  let l:command = input('command: ')
  execute "lua vim.lsp.buf." . l:command . '()'
endfunction

set completeopt-=preview
if has('nvim')
lua << EOF
  local nvim_lsp = require'lspconfig'
  local function hls_on_attach(client, bufnr)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  end
  nvim_lsp.hls.setup({
    on_attach = hls_on_attach
  })

nvim_lsp.fsautocomplete.setup({
cmd = { "fsautocomplete", "--background-service-enabled" },
on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end
})
nvim_lsp.rust_analyzer.setup({
cmd = { "rust-analyzer" },
settings = {
  ["rust-analyzer"] = {
    assist = {
      importGranularity = "module",
      importPrefix = "by_self",
      },
    cargo = {
      loadOutDirsFromCheck = true
      },
    procMacro = {
    enable = true
    },
    diagnostics = {
       enable = true,
       },
  }
}
})
nvim_lsp.tsserver.setup({
    on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    end,
})
nvim_lsp.ocamllsp.setup({})
EOF
endif
let g:syntastic_ocaml_checkers = ['merlin']
" For vimdiff
set diffopt+=iwhite

nmap <leader>ll :lua vim.diagnostic.setloclist()<CR>
nmap <leader>v :call VimBufCommand()<CR>

augroup sml
  autocmd BufNewFile,BufRead *.fun set filetype=sml
augroup END

let g:OmniSharp_server_use_net6 = 1

" Disable mouse
set mouse=
hi Type ctermfg=lightblue

map <leader>e :lua vim.diagnostic.open_float(0, {scope="line"})<CR>
