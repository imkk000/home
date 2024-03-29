-- Plugin: https://github.com/nvim-telescope/telescope.nvim
return {
  plugins.editor.repo_telescope,
  name = plugins.editor.telescope,
  dependencies = plugins.ui.plenary,
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
  },
  keys = {
    { "gb", "<cmd>Telescope buffers<cr>", desc = " Buffers" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = " Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = " Live Grep" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = " Recent" },
  },
}
