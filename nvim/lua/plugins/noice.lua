return{
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
    config = function()
        require("notify").setup({
            render = "compact",
            stages = "no_animation",
        })
        require("noice").setup({
            lsp = {
                hover = {
                    enabled = false, -- this will disable hover warning
                },
                signature = {
                    enabled = false,
                },
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                    ["vim.lsp.util.stylize_markdown"] = false,
                    ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = {
                    views = {
                        cmdline_popup = {
                            position = {
                                row = "25%",
                                col = "50%",
                            },
                            size = {
                                min_width = 60,
                                width = "auto",
                                height = "auto",
                            },
                        },
                        cmdline_popupmenu = {
                            position = {
                                row = "67%",
                                col = "50%",
                            },
                        },
                    },
                },
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        })
    end
}
