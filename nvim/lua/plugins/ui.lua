return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup()
        end
    },
    "nvchad/volt",
    {
        "nvzone/minty",
        cmd = { "Shades", "Huefy" },
    },
    { lazy = true, "nvim-lua/plenary.nvim"},
    {
        "nvchad/ui",
        config = function()
            require "nvchad" 
        end
    },

    {
        "nvchad/base46",
        lazy = true,
        build = function()
            require("base46").load_all_highlights()
        end,
        vim.keymap.set("n", "<leader>th", function()
            require("nvchad.themes").open()
        end, { desc = "telescope nvchad themes" })
    },
}
