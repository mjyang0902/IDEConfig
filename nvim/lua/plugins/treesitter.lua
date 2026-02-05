return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    opts = {
        ensure_installed = "all",
        highlight = {
            enable = true,
            disable = { "latex" },
            additional_vim_regex_highlighting = { "latex", "markdown" },
        },
        indent = {
            enable = true,
        },
        playground = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,

                keymaps = {
                  ["af"] = "@function.outer",
                  ["if"] = "@function.inner",
                  ["ac"] = "@class.outer",
                  ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                  ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                },
                selection_modes = {
                  ['@parameter.outer'] = 'v', -- charwise
                  ['@function.outer'] = 'V', -- linewise
                  ['@class.outer'] = '<c-v>', -- blockwise
                },
                include_surrounding_whitespace = false,
            }, 
            swap = {
                enable = true,
            },
       },
    },
}


