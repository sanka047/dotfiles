--------------------------------------------------------------------------------
-- Leap Config
--------------------------------------------------------------------------------
local log = require('sanka047.utils.log')
local map = require('sanka047.utils.map').map

local M = {}

function M.setup()
    local has_leap, leap = pcall(require, 'leap')
    if not has_leap then
        log.error('leap not available', 'Config')
        return false
    end

    leap.setup({
        safe_labels = {}, -- autojump is disorienting with scrolloff 999
        labels = {
            -- don't include the following classes:
            --   * non home row pinky: 'q', 'z', 'p', '/'
            --   * non home row center col: 't', 'b', 'y', 'n'
            --   * bottow row ring: 'x', '.'
            --   * all capitals

            'j', 'f', 'k', 'd', 'l', 's', ';', 'a', 'h', 'g',
            'u', 'r', 'i', 'e', 'o', 'w',
            'm', 'v', ',', 'c',
        },
    })
end

function M.bidirectional_leap()
    require('leap').leap({ target_windows = { vim.fn.win_getid() } })
end

function M.keymap()
    map('nxo', 's', 'leap bidirectional', M.bidirectional_leap)
end

return M
