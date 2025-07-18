local keymap = vim.keymap
local opts = { silent = true, noremap = true }

-- Delete keymaps
pcall(keymap.del, "n", "<c-up>")
pcall(keymap.del, "n", "<c-down")
pcall(keymap.del, "n", "<c-left>")
pcall(keymap.del, "n", "<c-right>")
pcall(keymap.del, "n", "<c-h>")
pcall(keymap.del, "n", "<c-j")
pcall(keymap.del, "n", "<c-k>")
pcall(keymap.del, "n", "<c-l>")
pcall(keymap.del, "n", "grr")
pcall(keymap.del, "n", "gra")
pcall(keymap.del, "n", "grn")
pcall(keymap.del, "n", "gri")
pcall(keymap.del, "n", "gO")

keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

opts.desc = "Delete single character"
keymap.set("n", "x", '"_x', opts)

opts.desc = " Select all text"
keymap.set("n", "<leader>a", "ggVG", opts)
opts.desc = " Cut all text"
keymap.set("n", "<leader>A", "ggVGd", opts)

opts.desc = " Save file"
-- stylua: ignore
keymap.set({ "i", "x", "n", "s" }, "<c-s>", function() vim.cmd("w") end, opts)

opts.desc = " spider-w"
keymap.set({ "n", "o", "x" }, "W", "<cmd>lua require('spider').motion('w')<cr>", opts)
opts.desc = " spider-e"
keymap.set({ "n", "o", "x" }, "E", "<cmd>lua require('spider').motion('e')<cr>", opts)
opts.desc = " spider-b"
keymap.set({ "n", "o", "x" }, "B", "<cmd>lua require('spider').motion('b')<cr>", opts)

opts.desc = " Split Window Vertically"
keymap.set("n", "<c-w>\\", "<c-w>v", opts)
opts.desc = " Split Window"
keymap.set("n", "<c-w>-", "<c-w>s", opts)

opts.desc = "Previous Buffer"
keymap.set("n", "[b", "<cmd>bprev<cr>", opts)
opts.desc = "Next Buffer"
keymap.set("n", "]b", "<cmd>bnext<cr>", opts)

-- force to use the default format function
local format = function()
  require("util.lsp").format({ buf = 0 })
end
vim.keymap.set("n", "gf", format, { desc = "Format" })
