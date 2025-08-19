-- Always use current opened file as the current working directoy (if true)
vim.o.autochdir = false

-- Relative line numbers
vim.o.relativenumber = true

-- Tab size
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Load all custom Lua code as "fake" plugins
require 'custom.custom_plugins'
