--------------------------------------------------------------------------------
-- Harpoon Config
--------------------------------------------------------------------------------
local log = require('sanka047.utils.log')
local map = require('sanka047.utils.map').map
local map_group = require('sanka047.utils.map').map_group

local M = {}

function M.setup()
    local ok, harpoon = pcall(require, 'harpoon')
    if not ok then
        log.error('harpoon not available', 'Config')
        return false
    end

    harpoon.setup({
        global_settings = {
            excluded_filetypes = { 'harpoon', 'TelescopePrompt', 'DressingInput' },
        },
    })
end

--------------------------------------------------------------------------------
-- Harpoon Keymap
--------------------------------------------------------------------------------
function M.keymap()
    map('n', 'M', 'Add Mark', function () require('harpoon.mark').add_file() end)

    map_group('n', '<leader>m', 'harpoon')
    map('n', '<leader>mm', 'Open Mark Menu', function () require('harpoon.ui').toggle_quick_menu() end)
end

return M
