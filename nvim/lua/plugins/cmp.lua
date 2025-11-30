-- Define the leave_snippet function globally
_G.leave_snippet = function()
    if
        ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
        require('luasnip').unlink_current()
    end
end
return{
    "hrsh7th/nvim-cmp",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "kdheepak/cmp-latex-symbols",
        "micangl/cmp-vimtex",
        "saadparwaiz1/cmp_luasnip",
        {
            "saadparwaiz1/cmp_luasnip",
            dependencies = {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                }
            }
        },
        "zbirenbaum/copilot-cmp",
    },
    config = function()
        vim.api.nvim_command([[
            autocmd ModeChanged * lua leave_snippet()
            ]])
        require("luasnip").config.set_config({
            -- Enable autotriggered snippets
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
            update_events = {"TextChanged", "TextChangedI"},
            region_check_events = 'InsertEnter',
            delete_check_events = 'InsertLeave'
        })
        require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
        local auto_expand = require("luasnip").expand_auto
        require("luasnip").expand_auto = function(...)
            vim.o.undolevels = vim.o.undolevels
            auto_expand(...)
        end
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        -- local has_words_before = function()
        --     if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        --     return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
        -- end
        local in_mathzone = function()
            return vim.fn['vimtex#syntax#in_mathzone']() == 1
        end
        local luasnip = require("luasnip")

        require("copilot_cmp").setup()

        local cmp = require 'cmp'
        local options = {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            sources = cmp.config.sources {
                -- { name = "copilot" },
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
                { name = "buffer" },
                { name = 'render-markdown' },
            },
            mapping = cmp.mapping.preset.insert {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    local has_sidekick, sidekick = pcall(require, "sidekick")
                    if has_sidekick and sidekick.nes_jump_or_apply() then
                        return
                    end
                    if in_mathzone() then
                        if luasnip.choice_active() then
                            if cmp.visible() then
                                cmp.close()
                            else
                                luasnip.change_choice(1)
                            end
                        elseif cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })

                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    else
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        elseif luasnip.choice_active() then
                            luasnip.change_choice(1)
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end
                end, { "i", "s" }),

                ["<F2>"] = cmp.mapping(function() -- fallback)
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                        -- else
                        --     fallback()
                    end
                end, { "i", "s"}),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<F3>"] = cmp.mapping(function() --fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                        -- else
                        --     fallback()
                    end
                end, { "i", "s"} ),

                ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Esc>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.close()
                    else
                        fallback()
                    end
                end, { "i", "s"} ),
            },
        }
        options = vim.tbl_deep_extend("force", options, require "nvchad.cmp")
        require("cmp").setup(options)

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline({
                ['<Tab>'] = {
                    c = function (default)
                        if cmp.visible() then
                            return cmp.select_next_item()
                        else
                            default()
                        end
                    end
                },
                ["<F2>"] = {
                    c = function() -- default)
                        if cmp.visible() then
                            return cmp.confirm({ select = true })
                        end

                        -- default()
                    end,
                },
                ['<S-Tab>'] = {
                    c = function (default)
                        if cmp.visible() then
                            return cmp.select_prev_item()
                        else
                            default()
                        end
                    end
                },
            }),
            sources = {
                { name = 'buffer' },
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline({
                ['<Tab>'] = {
                    c = function (default)
                        if cmp.visible() then
                            return cmp.select_next_item()
                        else
                            default()
                        end
                    end
                },
                ["<F2>"] = {
                    c = function() --default)
                        if cmp.visible() then
                            return cmp.confirm({ select = true })
                        end

                        -- default()
                    end,
                },
                ['<S-Tab>'] = {
                    c = function (default)
                        if cmp.visible() then
                            return cmp.select_prev_item()
                        else
                            default()
                        end
                    end
                },
            }),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' }
            })
        })
        require("cmp").setup.filetype("tex", {
            sources = cmp.config.sources {
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
                { name = "buffer" },
                { name = "latex_symbols", options = 0 },
            },
        })
    end,
}

