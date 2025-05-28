-- Plugin: https://github.com/nvim-treesitter/nvim-treesitter
return {
  plugins.coding.repo_treesitter,
  name = plugins.coding.treesitter,
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    {
      -- Plugin: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      plugins.coding.repo_treesitter_textobject,
      name = plugins.coding.treesitter_textobject,
    },
    {
      -- Plugin: https://github.com/nvim-treesitter/nvim-treesitter-context
      plugins.coding.repo_treesitter_context,
      name = plugins.coding.treesitter_context,
    },
  },
  opts = {
    ensure_installed = "all",
    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
    textobjects = {
      lsp_interop = { enable = false },
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["at"] = "@comment.outer",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
        goto_previous = {
          ["[i"] = "@conditional.inner",
          ["[a"] = "@comment.outer",
        },
        goto_next = {
          ["]i"] = "@conditional.inner",
          ["]a"] = "@comment.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>]"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>["] = "@parameter.inner",
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
