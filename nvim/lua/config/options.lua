local g = vim.g
local opt = vim.opt

-- global
vim.bo.syntax = "off"

g.mapleader = " "
g.maplocalleader = "\\"
g.markdown_recommended_style = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- options
opt.autowrite = true
opt.background = "dark"
opt.backup = false
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0
opt.confirm = true
opt.cursorline = true
opt.encoding = "utf-8"
opt.errorbells = true
opt.expandtab = true
opt.fileencoding = "utf-8"
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldcolumn = "0"
opt.foldenable = true
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg"
opt.hidden = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.iskeyword:append("-")
opt.laststatus = 3
opt.list = true
opt.listchars:append("extends:❯")
opt.listchars:append("precedes:❮")
opt.listchars:append("trail:·")
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.rtp:append("/opt/homebrew/opt/fzf")
opt.rtp:append("~/.go/bin/fzf")
opt.scrolloff = 4
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append({ W = true, I = true, c = true })
opt.showcmd = true
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.spell = true
opt.spelllang = "en,custom"
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.timeout = true
opt.timeoutlen = 300
opt.title = true
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.visualbell = true
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false

vim.diagnostic.config({
  signs = { text = icons.diagnostic },
})
