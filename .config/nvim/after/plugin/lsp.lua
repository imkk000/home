local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
  'sumneko_lua',
  'bashls',
  'yamlls',
  'jsonls',
  'dockerls',
  'golangci_lint_ls',
  'graphql',
  'html',
  'marksman',
  'sqlls',
  'lemminx',
})
lsp.set_preferences({
  set_lsp_keymaps = false,
})
lsp.nvim_workspace({
  library = vim.api.nvim_get_runtime_file('', true)
})
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      format = {
        enable = true,
      },
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file('', true),
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.stdpath('config'),
          vim.fn.stdpath('config') .. '/init.lua',
          vim.fn.stdpath('config') .. '/lua',
        },
        maxPreload = 2000,
        preloadFileSize = 50000,
      },
      telemetry = {
        enable = false,
      },
    },
  }
})

local api = vim.api
local lsp_buf = vim.lsp.buf
lsp.on_attach(function(client, bufnr)
  api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  if client.server_capabilities.documentFormattingProvider then
    -- Auto formatting
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = api.nvim_create_augroup('LspFormatting', { clear = true }),
      buffer = bufnr,
      callback = function()
        lsp_buf.format({ async = true, bufnr = bufnr })
      end,
    })
  end

  -- set mappings
  require('core.mappings').lsp.register_mappings(client, bufnr)
end)

lsp.setup()