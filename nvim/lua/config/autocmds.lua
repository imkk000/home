local api = vim.api
local augroup = function(name)
  return api.nvim_create_augroup(name, { clear = true })
end
local autocmd = api.nvim_create_autocmd

autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Close filetypes with <q>
autocmd("FileType", {
  group = augroup("close_buffer_q"),
  pattern = {
    "guihua",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "checkhealth",
    "Trouble",
    "toggleterm",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Disable right click mouse
vim.cmd("aunmenu PopUp")
vim.api.nvim_clear_autocmds({ group = "nvim.popupmenu" })

-- Fish syntax
vim.api.nvim_create_autocmd("FileType", {
  pattern = "fish",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

-- Format on save
local util = require("util.lsp")
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("formatting", { clear = true }),
  callback = util.format,
})
