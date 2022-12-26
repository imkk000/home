-- Plugin for display status line
local lualine = require('lualine')

local filename = {
  'filename',
  path = 1,
  symbols = {
    modified = '[m]',
    readonly = '[r]',
    unnamed = '[u]',
    newfile = '[n]',
  }
}

lualine.setup({
  options = {
    theme = require('core.colorschemes').color.lualine,
    disabled_filetypes = {
      statusline = {
        'NvimTree',
        'packer',
        'qf',
      },
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { filename, 'lsp_progress' },
    lualine_x = { 'encoding', 'fileformat', 'filetype', 'filesize' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filename, 'lsp_progress' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { 'fugitive' },
})
