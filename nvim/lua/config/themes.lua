local themes_file = vim.fn.stdpath("config") .. "/themes"
vim.opt.runtimepath:append(themes_file)
vim.cmd.colorscheme("tomorrow_fork")
