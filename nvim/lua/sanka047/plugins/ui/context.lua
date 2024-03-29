--------------------------------------------------------------------------------
-- Treesitter-Context Config
--------------------------------------------------------------------------------
local log = require('sanka047.utils.log')

local M = {}

function M.setup()
    local ok, treesitter_context = pcall(require, 'treesitter-context')
    if not ok then
        log.error('nvim-treesitter-context not available', 'Config')
        return false
    end

    treesitter_context.setup({
        max_lines = 1,
        patterns = {
            default = {
                'class',
                'function',
                'method',
            },
        },
    })
end

return M
