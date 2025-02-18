local M = {}

M.base46 = {
    theme = 'Catppuccin',
    -- transparency = true
}

M.ui = {
    statusline = {
        theme = 'default',
        separator_style = "default",
        -- theme = require("custom.statusline"),
    },

    cmp = {
        icons_left = true
    },
}
return M
