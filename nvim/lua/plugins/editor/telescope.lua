-- Plugin: https://github.com/nvim-telescope/telescope.nvim
return {
  plugins.editor.repo_telescope,
  name = plugins.editor.telescope,
  dependencies = {
    plugins.ui.plenary,
    plugins.editor.bookmarks,
    {
      -- Plugin: https://github.com/debugloop/telescope-undo.nvim
      plugins.editor.repo_telescope_undo,
      name = plugins.editor.telescope_undo,
    },
    {
      -- Plugin: https://github.com/debugloop/telescope-undo.nvim
      plugins.editor.repo_telescope_luasnip,
      name = plugins.editor.telescope_luasnip,
    },
  },
  cmd = "Telescope",
  opts = {
    defaults = {
      file_ignore_patterns = {
        "mocks/",
      },
      mappings = {
        n = {
          q = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
    extensions = {
      undo = {
        side_by_side = true,
      },
    },
  },
  keys = {
    { "gb", "<cmd>Telescope buffers<cr>", desc = " Buffers" },
    { "<leader>fm", "<cmd>Telescope bookmarks list<cr>", desc = " Bookmarks" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = " Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = " Live Grep" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = " Recent" },
    { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = " Quickfix" },
    { "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = " Buffer Grep" },
    { "<leader>fl", "<cmd>Telescope luasnip<cr>", desc = " Luasnip" },
    { "<leader>u", "<cmd>Telescope undo<cr>", desc = " Undo" },
    { "<leader>fk", "<cmd>Telescope resume<cr>", desc = " Resume" },
  },
  config = function(_, opt)
    require("telescope").setup(opt)
    require("telescope").load_extension("undo")
    require("telescope").load_extension("luasnip")
    require("telescope").load_extension("bookmarks")
  end,
}
