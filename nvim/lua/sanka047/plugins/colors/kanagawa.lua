--------------------------------------------------------------------------------
-- Kanagawa Config
--------------------------------------------------------------------------------
local log = require('sanka047.utils.log')

local M = {}

function M.setup()
    local ok, kanagawa = pcall(require, 'kanagawa')
    if not ok then
        log.error('kanagawa not available', 'Config')
        return false
    end

    vim.g.kanagawa_lualine_bold = true

    -- Overrides
    local overrides = function (colors)
        local palette = colors.palette
        local theme = colors.theme
        return {
            InclineNormal = { bg = theme.syn.fun, fg = theme.ui.float.bg, bold = true },
            InclineNormalNC = { bg = theme.ui.bg_p1, fg = theme.ui.float.fg },

            FloatBorder = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
            NormalFloat = { fg = theme.ui.fg, bg = theme.ui.bg_dim },
            FloatTitle = { fg = theme.ui.float.bg, bg = palette.waveAqua2, bold = true },

            DressingNormal = { fg = theme.ui.fg, bg = palette.winterBlue },
            DressingBorder = { fg = palette.winterBlue, bg = theme.ui.bg },

            QuickScopePrimary = { fg = palette.crystalBlue, underline = true, bold = true },
            QuickScopeSecondary = { fg = theme.diag.warning, underline = true, bold = true },

            LeapMatch = { link = 'QuickScopeSecondary' },
            LeapLabelPrimary = { fg = theme.ui.float.bg, bg = palette.carpYellow, bold = true },
            LeapLabelSecondary = { fg = theme.ui.float.bg, bg = palette.crystalBlue, bold = true },
            LeapBackdrop = { fg = theme.syn.comment, bg = theme.ui.bg },

            ToggletermNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            ToggletermBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },

            TelescopePromptTitle = { fg = theme.ui.fg_reverse, bg = palette.autumnYellow, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },

            TelescopeResultsTitle = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },

            TelescopePreviewTitle = { fg = theme.ui.bg_dim, bg = palette.bg_dim },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            CmpCompletionBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg },
            CmpDocumentation = { bg = theme.ui.bg_m1 },
            CmpDocumentationBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg },

            CmpItemAbbrDeprecated = { fg = palette.katanaGray, bg = "NONE", strikethrough = true },
            CmpItemAbbrMatch = { fg = palette.crystalBlue, bg = "NONE", bold = true },
            CmpItemAbbrMatchFuzzy = { fg = palette.crystalBlue, bg = "NONE", bold = true },

            CmpItemKindField = { fg = theme.ui.pmenu.bg, bg = palette.autumnGreen },
            CmpItemKindProperty = { fg = theme.ui.pmenu.bg, bg = palette.autumnGreen },
            CmpItemKindEvent = { fg = theme.ui.pmenu.bg, bg = palette.autumnGreen },

            CmpItemKindText = { fg = theme.ui.pmenu.bg, bg = palette.springGreen },
            CmpItemKindEnum = { fg = theme.ui.pmenu.bg, bg = palette.carpYellow },
            CmpItemKindKeyword = { fg = theme.ui.pmenu.bg, bg = palette.oniViolet },

            CmpItemKindConstant = { fg = theme.ui.pmenu.bg, bg = palette.surimiOrange },
            CmpItemKindConstructor = { fg = theme.ui.pmenu.bg, bg = palette.surimiOrange },
            CmpItemKindReference = { fg = theme.ui.pmenu.bg, bg = palette.surimiOrange },

            CmpItemKindFunction = { fg = theme.ui.pmenu.bg, bg = palette.crystalBlue },
            CmpItemKindStruct = { fg = theme.ui.pmenu.bg, bg = palette.waveAqua2 },
            CmpItemKindClass = { fg = theme.ui.pmenu.bg, bg = palette.waveAqua2 },

            CmpItemKindModule = { fg = theme.ui.pmenu.bg, bg = palette.surimiOrange },
            CmpItemKindOperator = { fg = palette.carpYellow, bg = palette.boatYellow2 },

            CmpItemKindVariable = { fg = theme.ui.pmenu.bg, bg = palette.carpYellow },
            CmpItemKindFile = { fg = theme.ui.pmenu.bg, bg = palette.carpYellow },

            CmpItemKindUnit = { fg = theme.ui.pmenu.bg, bg = palette.carpYellow },
            CmpItemKindSnippet = { fg = theme.ui.pmenu.bg, bg = palette.carpYellow },
            CmpItemKindFolder = { fg = theme.ui.pmenu.bg, bg = palette.carpYellow },

            CmpItemKindMethod = { fg = theme.ui.pmenu.bg, bg = palette.crystalBlue },
            CmpItemKindValue = { fg = theme.ui.pmenu.bg, bg = palette.crystalBlue },
            CmpItemKindEnumMember = { fg = theme.ui.pmenu.bg, bg = palette.crystalBlue },

            CmpItemKindInterface = { fg = theme.ui.pmenu.bg, bg = palette.sakuraPink },
            CmpItemKindColor = { fg = theme.ui.pmenu.bg, bg = palette.sakuraPink },
            CmpItemKindTypeParameter = { fg = theme.ui.pmenu.bg, bg = palette.sakuraPink },
        }
    end

    kanagawa.setup({
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { bold = true },
        statementStyle = { bold = true },
        typeStyle = { bold = true },
        variablebuiltinStyle = { bold = true },
        transparent = false,
        dimInactive = false, -- while shade is broken
        globalStatus = true,
        colors = {
            theme = {
                all = {
                    ui = { bg_gutter = "none" },
                },
            },
        },
        overrides = overrides,
    })

    vim.cmd('colorscheme kanagawa')
end

return M
