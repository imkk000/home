-- Plugin: https://github.com/folke/flash.nvim
return {
  plugins.editor.repo_flash,
  name = plugins.editor.flash,
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end,   desc = "Flash" },
    { "r", mode = "o",               function() require("flash").remote() end, desc = "Flash Remote" },
  },
  opts = {
    modes = {
      char = {
        jump_labels = true,
      },
    },
  },
}
