local map_file_numbers = function()
  local mappings = {}
  for i = 1, 9, 1 do
    table.insert(mappings, {
      '<leader>' .. i,
      function()
        require('harpoon'):list():select(i)
      end,
      desc = 'Harpoon to file ' .. i,
    })
  end
  return mappings
end

local telescope_config = require('telescope.config').values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require('telescope.pickers')
    .new({}, {
      prompt_title = 'Harpoon',
      finder = require('telescope.finders').new_table {
        results = file_paths,
      },
      previewer = telescope_config.file_previewer {},
      sorter = telescope_config.generic_sorter {},
    })
    :find()
end

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}
  end,
  keys = {
    {
      '<leader>HA',
      function()
        require('harpoon'):list():add()
      end,
      desc = '[H]arpoon [A]dd file',
    },
    {
      '<leader>HR',
      function()
        require('harpoon'):list():remove()
      end,
      desc = '[H]arpoon [R]emove file',
    },
    {
      '<leader>h',
      function()
        toggle_telescope(require('harpoon'):list())
      end,
      desc = 'Open [h]arpoon window',
    },
    unpack(map_file_numbers()),
  },
}
