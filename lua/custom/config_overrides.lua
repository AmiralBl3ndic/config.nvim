-- Always use current opened file as the current working directoy
vim.o.autochdir = true

-- Relative line numbers
vim.o.relativenumber = true

-- Load all custom Lua code as "fake" plugins
require 'custom.custom_plugins'
