-- Plugin: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins.dap" },
    { import = "plugins.lsp" },
    { import = "plugins.coding" },
    { import = "plugins.editor" },
    { import = "plugins.editor.mini" },
    { import = "plugins.ui" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  change_detection = { enabled = true, notify = false },
  checker = { enabled = false },
})

vim.cmd.colorscheme("tomorrow_fork")