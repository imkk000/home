-- Plugin: https://github.com/neovim/nvim-lspconfig
return {
  plugins.lsp.repo_lspconfig,
  name = plugins.lsp.lspconfig,
  dependencies = {
    plugins.coding.completion.sources.lsp_cmp,
    plugins.lsp.mason_lspconfig,
    {
      -- Plugin: https://github.com/b0o/SchemaStore.nvim
      plugins.lsp.repo_schema_store,
      name = plugins.lsp.schema_store,
      lazy = true,
    },
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    diagnostics = { underline = false },
    autoformat = true,
    servers = {
      gopls = {
        settings = {
          gopls = {
            vulncheck = "Imports",
            usePlaceholders = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },
      jsonls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        end,
        settings = {
          json = {
            format = { enable = true },
            validate = { enable = true },
          },
        },
      },
      yamlls = {
        on_new_config = function(new_config)
          new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
          vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
        end,
        settings = {
          yaml = {
            schemaStore = { enable = true },
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.lsp.enable(servers.lsp, false)
    vim.lsp.inlay_hint.enable(true)

    local config = require("lspconfig")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local on_attach = function(_, bufnr)
      local buf_opts = { silent = true, noremap = true, buffer = bufnr }
      local tc = require("telescope.builtin")
      local tc_opts = { reuse_window = true }
      local util = require("util.lsp")
      local map = function(...)
        util.map(buf_opts, ...)
      end
      local format = function()
        vim.lsp.buf.format({ timeout_ms = 10000, aysnc = false, bufnr = bufnr })
      end

      map("formatting", "n", "gf", format, "Format")
      map("rangeFormatting", "v", "gf", format, "Format")
      map("rename", "n", "gn", vim.lsp.buf.rename, "Rename")
      -- stylua: ignore
      map("definition", "n", "gd", function() tc.lsp_definitions(tc_opts) end, "Goto Definition")
      map("references", "n", "gr", "<cmd>Telescope lsp_references<cr>", "References")
      map("declaration", "n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
      -- stylua: ignore
      map("implementation", "n", "gi", function() tc.lsp_implementations(tc_opts) end, "Goto Implementation")
      -- stylua: ignore
      map("typeDefinition", "n", "gy", function() tc.lsp_type_definitions(tc_opts) end, "Goto Type Definition")
      map("hover", "n", "K", vim.lsp.buf.hover, "Hover")
      map("codeAction", "n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
      map("documentSymbol", "n", "gS", tc.lsp_document_symbols, "Document Symbol")
      map("signatureHelp", "n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
      map("diagnostics", "n", "gs", tc.diagnostics, "Diagnostics")

      -- format on save
      if util.has(bufnr, "formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("formatting", { clear = true }),
          buffer = bufnr,
          callback = format,
        })
      end
    end

    for _, server in ipairs(servers.lsp) do
      local settings = {}
      if opts.servers[server] then
        settings = opts.servers[server].settings or {}

        -- override configure when load plugins
        local on_new_config = opts.servers[server].on_new_config or function(_) end
        on_new_config(opts.servers[server])
      end

      config[server].setup({
        settings = settings,
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end
  end,
}
