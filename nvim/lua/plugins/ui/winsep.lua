-- Plugin: https://github.com/nvim-zh/colorful-winsep.nvim
return {
  plugins.ui.repo_winsep,
  name = plugins.ui.winsep,
  config = true,
  event = { "WinLeave" },
}
