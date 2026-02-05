return {
    "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 1 },
                    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
                    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
                    {
                        pane = 2,
                        icon = " ",
                        desc = "Browse Repo",
                        padding = 1,
                        key = "b",
                        action = function()
                            Snacks.gitbrowse()
                            end,
                    },
                    function()
                        local in_git = Snacks.git.get_root() ~= nil
                        local cmds = {
                            {
                                title = "Notifications",
                                cmd = "gh notify -s -a -n5",
                                action = function()
                                    vim.ui.open("https://github.com/notifications")
                                    end,
                                key = "n",
                                icon = " ",
                                height = 5,
                                enabled = true,
                            },
                            {
                                title = "Open Issues",
                                cmd = "gh issue list -L 3",
                                key = "i",
                                action = function()
                                    vim.fn.jobstart("gh issue list --web", { detach = true })
                                    end,
                                icon = " ",
                                height = 7,
                            },
                            {
                                icon = " ",
                                title = "Open PRs",
                                cmd = "gh pr list -L 3",
                                key = "P",
                                action = function()
                                    vim.fn.jobstart("gh pr list --web", { detach = true })
                                    end,
                                height = 7,
                            },
                            {
                                icon = " ",
                                title = "Git Status",
                                cmd = "git --no-pager diff --stat -B -M -C",
                                height = 10,
                            },
                        }
                    return vim.tbl_map(function(cmd)
                            return vim.tbl_extend("force", {
                                pane = 2,
                                section = "terminal",
                                enabled = in_git,
                                padding = 1,
                                ttl = 5 * 60,
                                indent = 3,
                                }, cmd)
                            end, cmds)
                        end,
                    { section = "startup" },
                },
            },
            explorer = {
                enabled = true, -- 開啟 Explorer 模組
                replace_netrw = true, -- 讓它取代預設的 netrw
            },
            gh = { enabled = true },
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
            { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
            { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader><space>", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>lg", function() Snacks.lazygit() end, desc = "LazyGit" },
        },
}
