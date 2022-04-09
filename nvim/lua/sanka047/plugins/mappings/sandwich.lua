--------------------------------------------------------------------------------
-- Vim-Sandwich Keymap
--------------------------------------------------------------------------------
local wk = require('which-key')
local map = require('sanka047.core.utils').map

local opts = { noremap = false }

-- add
map('', '<leader>sa', 'Sandwich Add', '<Plug>(operator-sandwich-add)', opts)

-- delete
map('nx', '<leader>sd', 'Sandwich Delete', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)', opts)
map('n', '<leader>sdb', 'Sandwich Delete (Auto)', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)', opts)

-- replace
map('nx', '<leader>sr', 'Sandwich Replace', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)', opts)
map('n', '<leader>srb', 'Sandwich Replace (Auto)', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)', opts)