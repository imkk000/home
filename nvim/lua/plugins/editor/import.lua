-- Plugin: https://github.com/piersolenski/import.nvim
return {
  plugins.editor.repo_import,
  name = plugins.editor.import,
  dependencies = { plugins.editor.tellescope },
  event = "VeryLazy",
  config = true,
  keys = {
    { "<leader>i", "<cmd>Import<cr>", desc = "Import" },
  },
}
