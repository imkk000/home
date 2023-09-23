-- Plugin: https://github.com/neovim/nvim-lspconfig
return {
  plugins.lsp.repo_lspconfig,
  name = plugins.lsp.lspconfig,
  dependencies = {
    plugins.coding.completion.sources.lsp_cmp,
    plugins.lsp.mason_lspconfig,
    {
      -- Plugin: https://github.com/folke/neodev.nvim
      plugins.lsp.lua.repo_neodev,
      name = plugins.lsp.lua.neodev,
      config = true,
    },
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    local config = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local on_attach = function(_, bufnr)
      local buf_opts = { silent = true, noremap = true, buffer = bufnr }
      local tc = require("telescope.builtin")
      local tc_opts = { reuse_window = true }
      local util = require("util.lsp")
      local map = function(...)
        util.map(buf_opts, ...)
      end
      local format = function()
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == "null-ls"
          end,
          bufnr = bufnr,
        })
      end

      map("formatting", "n", "<leader>cf", format, "Format")
      map("rangeFormatting", "v", "<leader>cf", format, "Format")
      map("rename", "n", "<leader>cr", vim.lsp.buf.rename, "Rename")
      map("definition", "n", "gd", function()
        tc.lsp_definitions(tc_opts)
      end, "Goto Definition")
      map("references", "n", "gr", "<cmd>Telescope lsp_references<cr>", "References")
      map("declaration", "n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
      map("implementation", "n", "gI", function()
        tc.lsp_implementations(tc_opts)
      end, "Goto Implementation")
      map("typeDefinition", "n", "gy", function()
        tc.lsp_type_definitions(tc_opts)
      end, "Goto Type Definition")
      map("hover", "n", "K", vim.lsp.buf.hover, "Hover")
      map("signatureHelp", "n", "gK", vim.lsp.buf.signature_help, "Signature Help")
      map("signatureHelp", "i", "<c-k>", vim.lsp.buf.signature_help, "Signature Help")
      map("diagnostic", "n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
      map("diagnostic", "n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
      map("codeAction", "n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

      -- format on save
      if util.has(bufnr, "formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("formatting", { clear = true }),
          buffer = bufnr,
          callback = format,
        })
      end

      -- inlay hint
      if util.has(bufnr, "inlayHint") then
        local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
        inlay_hint(bufnr, true)
      end
    end

    for _, server in ipairs(servers.lsp) do
      local settings = {}
      if opts.servers[server] then
        settings = opts.servers[server].settings or {}
      end

      config[server].setup({
        settings = settings,
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end
  end,
}