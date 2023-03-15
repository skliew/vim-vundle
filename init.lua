vim.cmd('source ~/.vimrc')
function VimBufCommand()
  vim.ui.input({ prompt = 'command: ', completion = 'customlist,VimBufCompletion' }, function(input)
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
  cmd = { "haskell-language-server-wrapper", "--lsp" },
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
