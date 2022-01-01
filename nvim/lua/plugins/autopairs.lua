--------------------------------------------------------------------------------
-- Nvim-Autopairs Config
--------------------------------------------------------------------------------
local npairs = require('nvim-autopairs')

-- npairs.setup({
--     disable_filetype = {'TelescopePrompt'},
--     map_bs = false,
--     map_cr = false,

--     fast_wrap = {},
-- })
npairs.setup({
    disable_filetype = {'TelescopePrompt'},
    map_bs = true,
    map_cr = false,

    fast_wrap = {},
})

--------------------------------------------------------------------------------
-- Nvim-Autopairs Keymap (to work with coq_nvim)
--------------------------------------------------------------------------------
-- local wk = require('which-key')

-- function _G.MUtils.CR()
--     if vim.fn.pumvisible() ~= 0 then
--         if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
--             return npairs.esc('<c-y>')
--         else
--             return npairs.esc('<c-e>') .. npairs.autopairs_cr()
--         end
--     else
--         return npairs.autopairs_cr()
--     end
-- end

-- function _G.MUtils.BS()
--     if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
--         return npairs.esc('<c-e>') .. npairs.autopairs_bs()
--     else
--         return npairs.autopairs_bs()
--     end
-- end

-- wk.register({
--     ['<CR>'] = { 'v:lua.MUtils.CR()', '<CR>' },
--     ['<BS>'] = { 'v:lua.MUtils.BS()', '<BS>' },
-- }, { mode = 'i' })
