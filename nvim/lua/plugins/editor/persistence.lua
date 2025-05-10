-- Plugin: https://github.com/folke/persistence.nvim
return {
  plugins.editor.repo_persistence,
  name = plugins.editor.persistence,
  event = "BufReadPre",
  config = true,
  keys = {
    -- stylua: ignore
    { "<leader>sl", function() require('persistence').load() end, desc = " Load Session" },
    -- stylua: ignore
    { "<leader>ss", function() require('persistence').select() end, desc = " Select Session" },
    -- stylua: ignore
    { "<leader>l", function() require('persistence').load({ last = true }) end, desc = " Load Last Session" },
  },
}
