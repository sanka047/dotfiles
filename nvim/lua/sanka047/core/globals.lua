--------------------------------------------------------------------------------
-- Define Useful Global Functions
--------------------------------------------------------------------------------
local log = require('sanka047.utils.log')

P = function(v)
    vim.pretty_print(v)
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end

MATCH_LOADED_PACKAGES = function (pattern)
    local local_packages = {}
    for k, v in pairs(package.loaded) do
        if string.find(k, pattern) then
            local_packages[k] = v
        end
    end
    return local_packages
end

LOAD_CONFIG = function(plugin)
    local load_success, config = pcall(require, 'sanka047.plugins.configs.' .. plugin)
    if not load_success then
        log.error(plugin .. ' config failed to load.', 'Config')
        return false
    end

    local ok = pcall(config.setup)
    if not ok then
        log.error(plugin .. ' setup failed/does not exist.', 'Config')
        return false
    end

    return true
end

LOAD_MAPPING = function(plugin)
    local load_success, mapping = pcall(require, 'sanka047.plugins.mappings.' .. plugin)
    if not load_success then
        require('sanka047.utils.log').error(plugin .. ' config failed to load.', 'Config')
        return false
    end

    local ok = pcall(mapping.keymap)
    if not ok then
        log.error(plugin .. ' keymap failed/does not exist.', 'Keymap')
        return false
    end

    return true
end
