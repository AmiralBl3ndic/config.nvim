-- Always use current opened file as the current working directoy
vim.o.autochdir = true

-- Relative line numbers
vim.o.relativenumber = true

-- Auto-toggle relative line numbers based on mode
vim.g.auto_relativenumber = true
vim.api.nvim_create_augroup('numbertoggle', { clear = true })

-- Enable relative numbers in Normal and Visual modes
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
  group = 'numbertoggle',
  callback = function()
    if vim.g.auto_relativenumber == true and vim.o.number and vim.api.nvim_get_mode().mode ~= 'i' then
      vim.o.relativenumber = true
    end
  end,
})

-- Disable relative numbers in Insert and other editing modes
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
  group = 'numbertoggle',
  callback = function()
    if vim.g.auto_relativenumber == true and vim.o.number then
      vim.o.relativenumber = false
    end
  end,
})

vim.api.nvim_create_user_command('AutoLineNumberToggleOn', function()
  vim.g.auto_relativenumber = true
end, {})

vim.api.nvim_create_user_command('AutoLineNumberToggleOff', function()
  vim.g.auto_relativenumber = false
end, {})

vim.api.nvim_create_user_command('AutoLineNumberToggle', function()
  vim.g.auto_relativenumber = not vim.g.auto_relativenumber
end, {})
