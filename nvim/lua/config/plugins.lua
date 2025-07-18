local _plugins = {
  dap = {
    dap = "mfussenegger/nvim-dap",
    dap_ui = "rcarriga/nvim-dap-ui",
    dap_virtual_text = "theHamsta/nvim-dap-virtual-text",
    mason_dap = "jay-babu/mason-nvim-dap.nvim",
    dap_go = "leoluz/nvim-dap-go",
  },
  lsp = {
    go = "ray-x/go.nvim",
    lazydev = "folke/lazydev.nvim",
    schema_store = "b0o/SchemaStore.nvim",
    lspconfig = "neovim/nvim-lspconfig",
    null_ls = "nvimtools/none-ls.nvim",
    mason = "williamboman/mason.nvim",
    mason_lspconfig = "williamboman/mason-lspconfig.nvim",
    mason_null_ls = "jay-babu/mason-null-ls.nvim",
  },
  coding = {
    completion = {
      sources = {
        copilot_cmp = "zbirenbaum/copilot-cmp",
        lsp_cmp = "hrsh7th/cmp-nvim-lsp",
        luasnip_cmp = "saadparwaiz1/cmp_luasnip",
        path_cmp = "hrsh7th/cmp-path",
        cmdline_cmp = "hrsh7th/cmp-cmdline",
        spell_cmp = "f3fora/cmp-spell",
        buffer_cmp = "hrsh7th/cmp-buffer",
      },
      cmp = "hrsh7th/nvim-cmp",
      copilot = "zbirenbaum/copilot.lua",
      lspkind = "onsails/lspkind.nvim",
      luasnip = "L3MON4D3/LuaSnip",
      friendly_snippets = "rafamadriz/friendly-snippets",
    },
    treesitter = "nvim-treesitter/nvim-treesitter",
    treesitter_textobject = "nvim-treesitter/nvim-treesitter-textobjects",
    treesitter_context = "nvim-treesitter/nvim-treesitter-context",
    autotag = "windwp/nvim-ts-autotag",
    autopairs = "windwp/nvim-autopairs",
  },
  editor = {
    mini = {
      mini = "echasnovski/mini.nvim",
      mini_surround = "echasnovski/mini.surround",
      mini_indentscope = "echasnovski/mini.indentscope",
      mini_bufremove = "echasnovski/mini.bufremove",
      mini_comment = "echasnovski/mini.comment",
    },
    neo_tree = "nvim-neo-tree/neo-tree.nvim",
    lualine = "nvim-lualine/lualine.nvim",
    illuminate = "RRethy/vim-illuminate",
    tmux_navigator = "aserowy/tmux.nvim",
    flash = "folke/flash.nvim",
    telescope = "nvim-telescope/telescope.nvim",
    which_key = "folke/which-key.nvim",
    colorizer = "norcalli/nvim-colorizer.lua",
    todo_comments = "folke/todo-comments.nvim",
    gitsigns = "lewis6991/gitsigns.nvim",
    spider = "chrisgrieser/nvim-spider",
    rainbow_delimiters = "HiPhish/rainbow-delimiters.nvim",
    spectre = "nvim-pack/nvim-spectre",
    telescope_undo = "debugloop/telescope-undo.nvim",
    telescope_luasnip = "benfowler/telescope-luasnip.nvim",
    persistence = "folke/persistence.nvim",
    trim = "cappyzawa/trim.nvim",
    bookmarks = "tomasky/bookmarks.nvim",
    import = "piersolenski/import.nvim",
  },
  ui = {
    web_devicons = "nvim-tree/nvim-web-devicons",
    nui = "MunifTanjim/nui.nvim",
    plenary = "nvim-lua/plenary.nvim",
    window_picker = "s1n7ax/nvim-window-picker",
    dressing = "stevearc/dressing.nvim",
    notify = "rcarriga/nvim-notify",
    noice = "folke/noice.nvim",
    navic = "SmiteshP/nvim-navic",
    alpha = "goolord/alpha-nvim",
    guihua = "ray-x/guihua.lua",
    nio = "nvim-neotest/nvim-nio",
    winsep = "nvim-zh/colorful-winsep.nvim",
  },
}

local new_table = function(t)
  return setmetatable({}, {
    __index = function(_, key)
      local is_base = key:sub(1, 5) == "repo_"
      if is_base then
        key = key:sub(6)
      end
      if t[key] == nil then
        return nil
      end
      if is_base then
        return t[key]
      end
      return key
    end,
  })
end

-- TODO: hard ways, fix later
_G.plugins = {
  dap = new_table(_plugins.dap),
  lsp = new_table(_plugins.lsp),
  coding = (function()
    local coding = new_table(_plugins.coding)
    coding.completion = new_table(_plugins.coding.completion)
    coding.completion.sources = new_table(_plugins.coding.completion.sources)
    return coding
  end)(),
  editor = (function()
    local editor = new_table(_plugins.editor)
    editor.mini = new_table(_plugins.editor.mini)
    return editor
  end)(),
  ui = new_table(_plugins.ui),
}
