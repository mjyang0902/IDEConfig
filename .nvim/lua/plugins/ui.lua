return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup()
        end
    },
    -- "nvchad/volt",
    -- {
    --     "nvzone/minty",
    --     cmd = { "Shades", "Huefy" },
    -- },
    -- { lazy = true, "nvim-lua/plenary.nvim"},
    -- {
    --     "nvchad/ui",
    --     config = function()
    --         require "nvchad"
    --     end,
    --     vim.keymap.set("n", "<Tab>", function()
    --         if vim.bo.ft == "nvcheatsheet" or vim.bo.ft == "NvimTree" then
    --             return 
    --         end
    --
    --         local has_sidekick, sidekick = pcall(require, "sidekick")
    --         if has_sidekick and sidekick.nes_jump_or_apply() then
    --             return
    --         end
    --
    --         require("nvchad.tabufline").next()
    --     end, { desc = "Smart Next Buffer" }),
    --
    --     vim.keymap.set("n", "<S-Tab>", function()
    --         if vim.bo.ft == "nvcheatsheet" then return end
    --         require("nvchad.tabufline").prev()
    --     end, { desc = "Prev Buffer" })
    -- },
    -- {
    --     "nvchad/base46",
    --     lazy = true,
    --     build = function()
    --         require("base46").load_all_highlights()
    --     end,
    --     vim.keymap.set("n", "<leader>th", function()
    --         require("nvchad.themes").open()
    --     end, { desc = "telescope nvchad themes" })
    -- },
}

