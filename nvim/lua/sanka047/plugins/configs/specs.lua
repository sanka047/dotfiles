--------------------------------------------------------------------------------
-- Specs Config
--------------------------------------------------------------------------------
local ok, specs = pcall(require, 'specs')
if not ok then
    print('specs not available')
    return false
end

specs.setup({
    show_jumps = true,
    min_jump = 30,
    popup = {
        delay_ms = 0,
        inc_ms = 10,
        blend = 20,
        width = 30,
        winhl = 'Search',
        fader = specs.exp_fader,
        resizer = specs.shrink_resizer,
    },
    ignore_buftypes = {
        nofile = true,
    },
})
