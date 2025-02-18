return {
    -- -- {
    -- --    "folke/tokyonight.nvim",
    -- --    dependencies = {
    -- --        "nvim-lualine/lualine.nvim",
    -- --        "nvim-tree/nvim-web-devicons",
    -- --        "utilyre/barbecue.nvim",
    -- --        "SmiteshP/nvim-navic",
    -- --    },
    -- --    config = function()
    -- --        vim.cmd[[colorscheme tokyonight-storm]]
    -- --        require('lualine').setup({
    -- --            options = {
    -- --                theme = 'tokyonight'
    -- --            },
    -- --        })
    -- --        require('barbecue').setup {
    -- --            theme = 'tokyonight',
    -- --        }
    -- --    end
    -- -- },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin-mocha",
    --     priority = 1000,
    --     dependencies = {
    --         "nvim-lualine/lualine.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --         "utilyre/barbecue.nvim",
    --         "SmiteshP/nvim-navic",
    --     },
    --     config = function()
    --         require("catppuccin").setup({
    --             -- transparent_background = true,
    --             -- no_bold = true,
    --             integrations = {
    --                 cmp = true,
    --                 neotree = true,
    --                 indent_blankline = {
    --                     enabled = true,
    --                     scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
    --                     colored_indent_levels = false,
    --                 },
    --                 lsp_saga = true,
    --                 mason = true,
    --                 mini = {
    --                     enabled = true,
    --                     indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
    --                 },
    --                 native_lsp = {
    --                     enabled = true,
    --                     virtual_text = {
    --                         errors = { "italic" },
    --                         hints = { "italic" },
    --                         warnings = { "italic" },
    --                         information = { "italic" },
    --                     },
    --                     underlines = {
    --                         errors = { "underline" },
    --                         hints = { "underline" },
    --                         warnings = { "underline" },
    --                         information = { "underline" },
    --                     },
    --                     inlay_hints = {
    --                         background = true,
    --                     },
    --                 },
    --             }
    --         })
    --         vim.cmd.colorscheme "catppuccin-macchiato"
    --         require('lualine').setup({
    --             options = {
    --                 theme = "catppuccin"
    --                 -- ... the rest of your lualine config
    --             }
    --         })vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
    --
    --         require("barbecue").setup {
    --             theme = "catppuccin-macchiato",
    --         }
    --     end
    -- },
    {
        'Mofiqul/vscode.nvim',
        config = function()
        local c = require('vscode.colors').get_colors()
        require('vscode').setup({
            -- Alternatively set style in setup
            -- style = 'light'

            -- Enable transparent background
            transparent = true,

            -- Enable italic comment
            italic_comments = true,

            -- Underline `@markup.link.*` variants
            underline_links = true,

            -- Disable nvim-tree background color
            disable_nvimtree_bg = true,

            -- Override colors (see ./lua/vscode/colors.lua)
            color_overrides = {
                vscLineNumber = '#FFFFFF',
            },

            -- Override highlight groups (see ./lua/vscode/theme.lua)
            group_overrides = {
                -- this supports the same val table as vim.api.nvim_set_hl
                -- use colors from this colorscheme by requiring vscode.colors!
                Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
            }
        })
        -- require('vscode').load()

        -- load the theme without affecting devicon colors.
        vim.cmd.colorscheme "vscode"
        end
    }
}
