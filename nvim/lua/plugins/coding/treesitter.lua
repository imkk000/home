-- Plugin: https://github.com/nvim-treesitter/nvim-treesitter
return {
  plugins.coding.repo_treesitter,
  name = plugins.coding.treesitter,
  event = { "BufReadPost", "BufNewFile" },
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    {
      -- Plugin: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      plugins.coding.repo_treesitter_textobject,
      name = plugins.coding.treesitter_textobject,
      branch = "main",
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
    textobjects = {
      select = {
        enable = true,
        lookahead = false,
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
          ["io"] = "@assignment.inner",
          ["ao"] = "@assignment.outer",
          ["fk"] = "@field.key",
          ["fv"] = "@field.value",
          ["ae"] = "@field.outer",
        },
      },
      move = { enable = false },
      swap = { enable = false },
      incremental_selection = { enable = false },
      lsp_interop = { enable = false },
    },
  },
}
