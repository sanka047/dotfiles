--------------------------------------------------------------------------------
-- Comment Config
--------------------------------------------------------------------------------
local log = require('sanka047.utils.log')
local map = require('sanka047.utils.map').map

local M = {}

function M.setup()
    local ok, Comment = pcall(require, 'Comment')
    if not ok then
        log.error('Comment not available', 'Config')
        return false
    end

    Comment.setup({
        ---Add a space b/w comment and the line
        ---@type boolean
        padding = true,

        ---Whether the cursor should stay at its position
        ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
        ---@type boolean
        sticky = true,

        ---Lines to be ignored while comment/uncomment.
        ---Could be a regex string or a function that returns a regex string.
        ---Example: Use '^$' to ignore empty lines
        ---@type string|fun():string
        ignore = '^$',

        ---LHS of toggle mappings in NORMAL + VISUAL mode
        ---@type table
        toggler = {
            ---Line-comment toggle keymap
            line = '<leader>cc',
            ---Block-comment toggle keymap
            block = '<leader>bc',
        },

        ---LHS of operator-pending mappings in NORMAL + VISUAL mode
        ---@type table
        opleader = {
            ---Line-comment keymap
            line = '<leader>c',
            ---Block-comment keymap
            block = '<leader>b',
        },

        ---LHS of extra mappings
        ---@type table
        extra = {
            ---Add comment on the line above
            above = '<leader>cO',
            ---Add comment on the line below
            below = '<leader>co',
            ---Add comment at the end of line
            eol = '<leader>cA',
        },

        ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
        ---@type table
        mappings = {
            ---Operator-pending mapping
            ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
            ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
            basic = true,
            ---Extra mapping
            ---Includes `gco`, `gcO`, `gcA`
            extra = true,
        },

        ---Pre-hook, called before commenting the line
        pre_hook = function (ctx)
            local utils = require('Comment.utils')

            local has_ctx_utils, ts_ctx_utils = pcall(require, 'ts_context_commentstring.utils')
            if not has_ctx_utils then
                require('sanka047.utils.log').warn(
                    'ts_context_commentstring is unavailable to provide commentstring',
                    'Config [Comment]'
                )
                return
            end

            -- Determine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == utils.ctype.line and '__default' or '__multiline'

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == utils.ctype.block then
                location = ts_ctx_utils.get_cursor_location()
            elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
                location = ts_ctx_utils.get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring({
                key = type,
                location = location,
            })
        end,

        ---Post-hook, called after commenting is done
        post_hook = nil,
    })
end


return M
