--[[
All lua files in this directory are auto-required and hence act as plugins.
There is no lazy-loading so this might not be super optimized.
This is done only to experiment with my own configuration rather than overloading with many plugins.
--]]

-- Auto-require all Lua files in this directory
local function auto_require_all()
  local current_dir = debug.getinfo(1, 'S').source:sub(2):match '(.*/)'
  local files = vim.fn.glob(current_dir .. '*.lua', false, true)

  for _, file in ipairs(files) do
    local filename = vim.fn.fnamemodify(file, ':t:r') -- get filename without extension
    if filename ~= 'init' then -- skip init.lua itself
      local module_name = 'custom.custom_plugins.' .. filename
      local ok, err = pcall(require, module_name)
      if not ok then
        vim.notify('Failed to load ' .. module_name .. ': ' .. err, vim.log.levels.ERROR)
      end
    end
  end
end

-- Load all plugins (files) in this directory
auto_require_all()

return {}
