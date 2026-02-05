-- snack.lua
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        notifier = { enabled = false },
        picker = { enabled = true },
        input = { enabled = true },
        indent = { 
            enabled = true,
            char = "│",
            animate = { enabled = true },
            hl = {
                indent = "IblChar",
                scope = "IblScopeChar",
            },
            only_scope = false,
            only_current = false,
            priority = 1,
        },
        scroll = { enabled = true },
        words = { enabled = true },
        lazygit = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
    },
    keys = {
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader><space>", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>lg", function() Snacks.lazygit() end, desc = "LazyGit" },
        
    }
}
