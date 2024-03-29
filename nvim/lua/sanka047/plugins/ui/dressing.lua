--------------------------------------------------------------------------------
-- Dressing Config
--------------------------------------------------------------------------------
local log = require('sanka047.utils.log')
local window = require('sanka047.utils.window')

local M = {}

function M.setup()
    local ok, dressing = pcall(require, 'dressing')
    if not ok then
        log.error('dressing not available', 'Config')
        return false
    end

    dressing.setup({
        input = {
            insert_only = false,
            prompt_align = 'right',
            win_options = {
                winblend = 0,
                winhighlight = 'NormalFloat:DressingNormal,FloatBorder:DressingBorder',
            },
            override = function (conf)
                conf['border'] = window.border(window.margin.FULL)
            end,
        },
        select = {
            backend = { "telescope", "builtin" },
            trim_prompt = true,
        },
    })
end

return M
