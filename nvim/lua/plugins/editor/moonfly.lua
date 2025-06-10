-- Plugin: https://github.com/bluz71/vim-moonfly-colors
return {
  plugins.editor.repo_moonfly,
  name = plugins.editor.moonfly,
  priority = 1000,
  lazy = false,
  enabled = false,
  config = function()
    vim.cmd.colorscheme("moonfly")
  end,
}
