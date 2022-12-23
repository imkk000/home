-- Enable package caching
require('impatient')

-- Override notify package
vim.notify = require('notify')

-- Reset autocmd
vim.cmd [[autocmd!]]

-- Require modules
require('core.autocommands')
require('core.options')
require('core.mappings')
require('core.colorschemes')
require('plugins')
