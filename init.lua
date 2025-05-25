local lazypath = '~/.vim/lazy.nvim'
vim.opt.rtp:prepend(lazypath)
vim.g.editorconfig = false

require('lazy').setup({
  root = '~/.vim/lazyinstall',
  spec = {
    { 'echasnovski/mini.diff' },
    { 'olimorris/codecompanion.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'wbthomason/packer.nvim' },
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'ctrlpvim/ctrlp.vim' },
    { 'vim-scripts/L9' },
    { 'preservim/nerdtree' },
    { 'tpope/vim-surround' },
    { 'vim-scripts/repeat.vim' },
    { 'vim-scripts/snipMate' },
    { 'tpope/vim-fugitive' },
    { 'jnwhiteh/vim-golang' },
    { 'tpope/vim-commentary' },
    { 'vim-scripts/ragtag.vim' },
    { 'vim-scripts/cscope_macros.vim' },
    { 'pangloss/vim-javascript' },
    { 'mxw/vim-jsx' },
    { 'rust-lang/rust.vim' },
    { 'elzr/vim-json' },
    { 'dense-analysis/ale' },
    { 'vim-scripts/matchit.zip' },
    { 'udalov/kotlin-vim' },
    { 'hzchirs/vim-material' },
    { 'chriskempson/base16-vim' },
    { 'gosukiwi/vim-atom-dark' },
    { 'leafgarland/typescript-vim' },
    { 'PhilT/vim-fsharp' },
    { 'OmniSharp/omnisharp-vim' },
    { 'neovimhaskell/haskell-vim' },
    { 'ziglang/zig.vim' },
    { 'peitalin/vim-jsx-typescript' },
    { 'croaker/mustang-vim' },
    { 'twerth/ir_black' },
    { 'nanotech/jellybeans.vim' },
    { 'junegunn/fzf' },
    { 'junegunn/fzf.vim' },
    { 'zah/nim.vim' },
    { 'andy-morris/happy.vim' },
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'scalameta/nvim-metals' },
    { 'dstein64/vim-startuptime' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

vim.cmd([[source ~/.vimrc]])

function VimBufCompletion(A, L, P)
  return vim.api.nvim_call_function('getcompletion', {"lua vim.lsp.buf." .. A , 'cmdline', ''})
end

function VimBufCommand()
  vim.ui.input({ prompt = 'command: ', completion = 'customlist,v:lua.VimBufCompletion' }, function(input)
    if input then
      vim.lsp.buf[input]()
    end
  end)
end

local nvim_lsp = require'lspconfig'
local function hls_on_attach(client, bufnr)
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end
nvim_lsp.hls.setup({
  on_attach = hls_on_attach
})

nvim_lsp.fsautocomplete.setup({
  cmd = { "fsautocomplete" },
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
nvim_lsp.ts_ls.setup({
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  end,
})

nvim_lsp.zls.setup({})
nvim_lsp.ocamllsp.setup({})
nvim_lsp.zls.setup({})
nvim_lsp.nim_langserver.setup({})
require('telescope').setup{
  defaults = {
    preview = false,
    sorting_strategy = 'ascending'
  },
  pickers = {
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
    }
  }
}

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', telescope_builtin.find_files)
vim.keymap.set('n', '<leader>b', telescope_builtin.buffers)
