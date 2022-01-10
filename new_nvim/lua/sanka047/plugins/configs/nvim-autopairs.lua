--------------------------------------------------------------------------------
-- Nvim-Autopairs Config
--------------------------------------------------------------------------------
local ok, npairs = pcall(require, 'nvim-autopairs')
if not ok then
    print('nvim-autopairs not available')
    return false
end

-- coq_nvim
-- npairs.setup({
--     disable_filetype = {'TelescopePrompt'},
--     map_bs = false,
--     map_cr = false,

--     fast_wrap = {},
-- })

-- nvim-cmp
npairs.setup({
    disable_filetype = {'TelescopePrompt'},
    map_bs = true,
    map_cr = false,

    fast_wrap = {},
})
