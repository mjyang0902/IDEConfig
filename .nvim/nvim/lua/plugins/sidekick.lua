return {
    "folke/sidekick.nvim",
    opts = {
        -- add any options here
        cli = {
            mux = {
                backend = "tmux",
                enabled = true,
            },
        },
    },
    keys = {
        {
            "<tab>",
            function()
                if vim.bo.ft == "nvcheatsheet" or vim.bo.ft == "NvimTree" then return end
                if require("sidekick").nes_jump_or_apply() then return end
                -- require("nvchad.tabufline").next()
            end,
            expr = true,
            desc = "Goto/Apply Next Edit Suggestion",
            mode = {"n"},
        },
        {
            "<c-.>",
            function() require("sidekick.cli").toggle() end,
            desc = "Sidekick Toggle",
            mode = { "n", "t", "i", "x" },
        },
        {
            "<leader>aa",
            function() require("sidekick.cli").toggle() end,
            desc = "Sidekick Toggle CLI",
        },
        {
            "<leader>as",
            function() require("sidekick.cli").select() end,
            -- Or to select only installed tools:
            -- require("sidekick.cli").select({ filter = { installed = true } })
            desc = "Select CLI",
        },
        {
            "<leader>ad",
            function() require("sidekick.cli").close() end,
            desc = "Detach a CLI Session",
        },
        {
            "<leader>at",
            function() require("sidekick.cli").send({ msg = "{this}" }) end,
            mode = { "x", "n" },
            desc = "Send This",
        },
        {
            "<leader>af",
            function() require("sidekick.cli").send({ msg = "{file}" }) end,
            desc = "Send File",
        },
        {
            "<leader>av",
            function() require("sidekick.cli").send({ msg = "{selection}" }) end,
            mode = { "x" },
            desc = "Send Visual Selection",
        },
        {
            "<leader>ap",
            function() require("sidekick.cli").prompt() end,
            mode = { "n", "x" },
            desc = "Sidekick Select Prompt",
        },
        -- Example of a keybinding to open Claude directly
        {
            "<leader>ac",
            function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
            desc = "Sidekick Toggle Claude",
        },
    },
    config = function(_, opts)
        require("sidekick").setup(opts)
        vim.api.nvim_set_hl(0, "SidekickDiffAdd", { 
            fg = "#98c379", 
            bg = "#1f2335",
            italic = true   
        })

       
        vim.api.nvim_set_hl(0, "SidekickDiffDelete", { 
            fg = "#505050", 
            bg = "NONE",
            strikethrough = true 
        })

       
        vim.api.nvim_set_hl(0, "SidekickSuggestion", { 
            fg = "#6272a4", 
            italic = true 
        })
    end,
}

