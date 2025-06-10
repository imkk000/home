-- Plugin: https://github.com/chriskempson/vim-tomorrow-theme
return {
  plugins.editor.repo_tomorrow,
  name = plugins.editor.tomorrow,
  priority = 1000,
  lazy = false,
  config = function(_, _)
    vim.cmd.colorscheme("Tomorrow-Night-Bright")
  end,
}
