--------------------------------------------------------------------------------
-- First Load Actions
--------------------------------------------------------------------------------
local log = require('sanka047.utils.log')

local function download_packer()
    log.warn('Packer is not installed', 'Plugins')

    local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
    vim.fn.delete(packer_path, 'rf')
    vim.fn.mkdir(packer_path, 'p')

    local out = vim.fn.system({
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        "--depth",
        "1",
        packer_path .. '/packer.nvim',
    })

    log.info(out, 'Plugins')
    log.info('Downloading packer.nvim...', 'Plugins')
    log.warn("( You'll need to restart now )", 'Plugins')
end

if not pcall(require, 'packer') then
    download_packer()
    vim.cmd([[packadd packer.nvim]])
    return true
end
return false
