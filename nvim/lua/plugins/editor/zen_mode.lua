-- Plugin: github.com/folke/zen-mode.nvim
return {
  plugins.editor.repo_zen_mode,
  name = plugins.editor.zen_mode,
  event = "InsertEnter",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  }
}
