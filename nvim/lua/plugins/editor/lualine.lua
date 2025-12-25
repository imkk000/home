-- Plugin: https://github.com/nvim-lualine/lualine.nvim
return {
  plugins.editor.repo_lualine,
  name = plugins.editor.lualine,
  dependencies = {
    plugins.ui.web_devicons,
    plugins.ui.navic,
  },
  event = "VeryLazy",
  config = true,
  opts = {
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename", "navic" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
    options = {
      theme = "catppuccin",
      disabled_filetypes = {
        statusline = {
          "alpha",
          "neo-tree",
          "guihua",
        },
      },
    },
  },
}
