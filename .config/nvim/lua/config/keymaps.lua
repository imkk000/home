local keymap = vim.keymap
local opts = { silent = true, remap = true }

-- Delete keymaps
pcall(keymap.del, "n", "<C-Up>")
pcall(keymap.del, "n", "<C-Down")
pcall(keymap.del, "n", "<C-Left>")
pcall(keymap.del, "n", "<C-Right>")
pcall(keymap.del, "n", "<C-h>")
pcall(keymap.del, "n", "<C-j")
pcall(keymap.del, "n", "<C-k>")
pcall(keymap.del, "n", "<C-l>")

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", ':lua require("tmux").move_left()<cr>', opts)
keymap.set("n", "<C-j>", ':lua require("tmux").move_bottom()<cr>', opts)
keymap.set("n", "<C-k>", ':lua require("tmux").move_top()<cr>', opts)
keymap.set("n", "<C-l>", ':lua require("tmux").move_right()<cr>', opts)

keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- Select all text in the buffer
keymap.set("n", "<leader>a", "ggVG", opts)
