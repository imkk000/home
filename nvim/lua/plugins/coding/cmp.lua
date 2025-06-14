-- Plugin: https://github.com/hrsh7th/nvim-cmp
return {
  plugins.coding.completion.repo_cmp,
  name = plugins.coding.completion.cmp,
  event = "InsertEnter",
  dependencies = {
    {
      -- Plugin: https://github.com/zbirenbaum/copilot-cmp
      plugins.coding.completion.sources.repo_copilot_cmp,
      name = plugins.coding.completion.sources.copilot_cmp,
      dependencies = plugins.coding.completion.copilot,
      config = true,
    },
    {
      -- Plugin: https://github.com/hrsh7th/cmp-nvim-lsp
      plugins.coding.completion.sources.repo_lsp_cmp,
      name = plugins.coding.completion.sources.lsp_cmp,
    },
    {
      -- Plugin: https://github.com/saadparwaiz1/cmp_luasnip
      plugins.coding.completion.sources.repo_luasnip_cmp,
      name = plugins.coding.completion.sources.luasnip_cmp,
    },
    {
      -- Plugin: https://github.com/hrsh7th/cmp-path
      plugins.coding.completion.sources.repo_path_cmp,
      name = plugins.coding.completion.sources.path_cmp,
    },
    {
      -- Plugin: https://github.com/f3fora/cmp-spell
      plugins.coding.completion.sources.repo_spell_cmp,
      name = plugins.coding.completion.sources.spell_cmp,
    },
    {
      -- Plugin: https://github.com/hrsh7th/cmp-buffer
      plugins.coding.completion.sources.repo_buffer_cmp,
      name = plugins.coding.completion.sources.buffer_cmp,
    },
    {
      -- Plugin: https://github.com/L3MON4D3/LuaSnip
      plugins.coding.completion.repo_luasnip,
      name = plugins.coding.completion.luasnip,
    },
    {
      -- Plugin: https://github.com/rafamadriz/friendly-snippets
      plugins.coding.completion.repo_friendly_snippets,
      name = plugins.coding.completion.friendly_snippets,
    },
    {
      -- Plugin: https://github.com/onsails/lspkind.nvim
      plugins.coding.completion.repo_lspkind,
      name = plugins.coding.completion.lspkind,
    },
  },
  config = function()
    local cmp = require("cmp")
    local ls = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").load({
      paths = {
        "~/.config/nvim/snippets",
        "~/.private-home/nvim/snippets",
      },
    })

    local opts = { silent = true, noremap = true }
    -- stylua: ignore start
    vim.keymap.set({ "i" }, "<c-k>", function() ls.expand({}) end, opts)
    vim.keymap.set({ "i", "s" }, "<c-l>", function() ls.jump(1) end, opts)
    vim.keymap.set({ "i", "s" }, "<c-h>", function() ls.jump(-1) end, opts)
    vim.keymap.set({ "i", "s" }, "<c-e>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, opts)
    vim.keymap.set({ "i", "s" }, "<c-s-e>", function()
      if ls.choice_active() then
        ls.change_choice(-1)
      end
    end, opts)

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup({
      sources = cmp.config.sources({
        { name = "luasnip",  priority = 1000 },
        { name = "copilot",  priority = 750 },
        { name = "nvim_lsp", priority = 500 },
        { name = "path",     priority = 200 },
        { name = "spell",    priority = 100 },
      }),
      mapping = cmp.mapping.preset.insert({
        ["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<c-b>"] = cmp.mapping.scroll_docs(-4),
        ["<c-f>"] = cmp.mapping.scroll_docs(4),
        ["<c-space>"] = cmp.mapping.complete(),
        -- ["<c-e>"] = cmp.mapping.abort(),
        ["<cr>"] = cmp.mapping.confirm({ select = false }),
        ["<s-cr>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
      }),
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 75,
          ellipsis_char = "...",
          symbol_map = icons.lspkind,
        }),
      },
    })
  end,
}
