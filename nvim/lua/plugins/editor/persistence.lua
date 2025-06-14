-- Plugin: https://github.com/folke/persistence.nvim
return {
  plugins.editor.repo_persistence,
  name = plugins.editor.persistence,
  event = "VeryLazy",
  config = true,
  lazy = true,
  keys = {
    -- stylua: ignore
    { "<leader>s", function() require('persistence').select() end, desc = " Select Session" },
    -- stylua: ignore
    { "<leader>l", function() require('persistence').load() end, desc = " Load Session" },
  },
}
