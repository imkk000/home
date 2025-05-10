-- Plugin: https://github.com/nvim-telescope/telescope.nvim
return {
  plugins.editor.repo_telescope,
  name = plugins.editor.telescope,
  dependencies = {
    plugins.ui.plenary,
    {
      -- Plugin: https://github.com/debugloop/telescope-undo.nvim
      plugins.editor.repo_telescope_undo,
      name = plugins.editor.telescope_undo,
    },
  },
  cmd = "Telescope",
  opts = {
    defaults = {
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
    { "'", "<cmd>Telescope marks<cr>", desc = " Marks" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = " Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = " Live Grep" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = " Recent" },
    { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = " Quickfix" },
    { "<leader>u", "<cmd>Telescope undo<cr>", desc = " Undo" },
    { "<leader>fk", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = " Buffer Grep" },
  },
  config = function(_, opt)
    require("telescope").setup(opt)
    require("telescope").load_extension("undo")
  end,
}
