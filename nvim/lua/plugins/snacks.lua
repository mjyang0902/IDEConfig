return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    init = function()
        vim.api.nvim_create_autocmd("BufReadPost", {
            once = true,
            callback = function()
                vim.schedule(function()
                    vim.cmd("filetype detect")
                end)
            end,
        })
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function() Snacks.debug.backtrace() end
        if vim.fn.has("nvim-0.11") == 1 then
            vim._print = function(_, ...) dd(...) end
        else
            vim.print = dd
        end
    end,

    opts = {
        animate = { enabled = true },
        bigfile = { enabled = true, size = 1.5 * 1024 * 1024 },
        bufdelete = { enabled = true },
        dashboard = require("config.dashboard").opts,
        debug = { enabled = true },
        dim = { enabled = true },
        explorer = { enabled = true },
        gh = { enabled = true },
        git = { enabled = true },
        gitbrowse = { enabled = true },
        image = {
            enabled = true,
            doc = { inline = true, float = true, max_width = 80, max_height = 40 },
        },
        indent = { enabled = true },
        input = { enabled = true },
        keymap = { enabled = true },
        layout = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        picker = {
            sources = { gh_issue = {}, gh_pr = {} }
        },
        profiler = { enabled = true },
        quickfile = { enabled = true },
        rename = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        scratch = { enabled = true },
        statuscolumn = { enabled = true },
        -- terminal = { enabled = true },
        toggle = { enabled = true },
        win = { enabled = true },
        words = { enabled = true },
        zen = { enabled = true },
    },

    config = function(_, opts)
        require("snacks").setup(opts)

        Snacks.toggle.dim():map("<leader>ud")
        Snacks.toggle.zen():map("<leader>uz")
        Snacks.toggle.profiler():map("<leader>pp")
        Snacks.toggle.profiler_highlights():map("<leader>ph")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.words():map("<leader>uw")
        Snacks.toggle.diagnostics():map("<leader>uD")

        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uf")
        Snacks.toggle.line_number():map("<leader>ul")
    end,

    keys = {
        { "<leader>bd",      function() Snacks.bufdelete() end,                        desc = "Delete Buffer" },
        { "<leader>e",       function() Snacks.explorer() end,                         desc = "File Explorer" },

        { "<leader>di",      function() Snacks.debug.inspect() end,                    desc = "Debug Inspect" },
        { "<leader>dl",      function() Snacks.debug.log() end,                        desc = "Debug Logs" },
        { "<leader>db",      function() Snacks.debug.backtrace() end,                  desc = "Debug Backtrace" },

        { "<leader>gi",      function() Snacks.picker.gh_issue() end,                  desc = "GitHub Issues (open)" },
        { "<leader>gI",      function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
        { "<leader>gp",      function() Snacks.picker.gh_pr() end,                     desc = "GitHub Pull Requests (open)" },
        { "<leader>gP",      function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "GitHub Pull Requests (all)" },
        { "<leader>gB",      function() Snacks.gitbrowse() end,                        desc = "Git Browse" },
        { "<leader>lg",      function() Snacks.lazygit() end,                          desc = "Lazygit" },
        { "<leader>gf",      function() Snacks.lazygit.log_file() end,                 desc = "Lazygit Current File Log" },

        { "<leader>nh",      function() Snacks.notifier.show_history() end,            desc = "Notification History" },
        { "<leader>nd",      function() Snacks.notifier.hide() end,                    desc = "Dismiss All Notifications" },
        { "<leader><space>", function() Snacks.picker.smart() end,                     desc = "Smart Find Files" },
        { "<leader>ff",      function() Snacks.picker.files() end,                     desc = "Find Files" },
        { "<leader>fg",      function() Snacks.picker.grep() end,                      desc = "Grep (Live)" },
        { "<leader>fb",      function() Snacks.picker.buffers() end,                   desc = "Buffers" },
        { "<leader>fh",      function() Snacks.picker.help() end,                      desc = "Help Pages" },

        { "<leader>ps",      function() Snacks.profiler.scratch() end,                 desc = "Profiler Scratch Buffer" },
        { "<leader>.",       function() Snacks.scratch() end,                          desc = "Toggle Scratch Buffer" },
        { "<leader>S",       function() Snacks.scratch.select() end,                   desc = "Select Scratch Buffer" },

        -- { "<leader>td", function() Snacks.terminal.toggle() end,          desc = "Toggle Terminal" },
        { "<c-/>",           function() Snacks.terminal.toggle() end,                  mode = { "n", "t" },                 desc = "Terminal" },


        { "gd",              function() Snacks.picker.lsp_definitions() end,           desc = "Goto Definition" },
        { "gr",              function() Snacks.picker.lsp_references() end,            nowait = true,                       desc = "References" },
        { "gi",              function() Snacks.picker.lsp_implementations() end,       desc = "Goto Implementation" },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end,      desc = "Goto T[y]pe Definition" },
        { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,               desc = "LSP Symbols" },
    },
}
