-- Plugin: https://github.com/akinsho/bufferline.nvim
return {
  plugins.editor.repo_bufferline,
  name = plugins.editor.bufferline,
  event = "VeryLazy",
  dependencies = {
    plugins.ui.web_devicons,
  },
  config = true,
  opts = {
    options = {
      separator_style = "slope",
      numbers = "both",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer [File|Buffer|Git]",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}