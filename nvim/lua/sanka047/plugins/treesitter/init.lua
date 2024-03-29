--------------------------------------------------------------------------------
-- Treesitter
--------------------------------------------------------------------------------
return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            {'nvim-treesitter/nvim-treesitter-textobjects'},
            {'RRethy/nvim-treesitter-textsubjects'},
            {
                'JoosepAlviste/nvim-ts-context-commentstring',
                init = function () vim.g.skip_ts_context_commentstring_module = true end
            },
            {'RRethy/nvim-treesitter-endwise'},
            {'windwp/nvim-ts-autotag'},
            {'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle'},
        },
        config = function ()
            LOAD_CONFIG('treesitter.core')
            LOAD_MAPPING('treesitter.core')
        end,
    },
}
