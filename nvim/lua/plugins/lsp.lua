local active_count = 0
local clear_timer = nil

return {
    "neovim/nvim-lspconfig",
    cmd = { "Mason", "Neoconf" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
        "folke/neoconf.nvim",
        "folke/lazydev.nvim",
        "nvimdev/lspsaga.nvim",
    },
    config = function()
        require("lazydev").setup()

        vim.diagnostic.config({
            underline = false,
            undercurl = false,
            virtual_text = false,
            signs = false
        })

        pcall(vim.keymap.del, "n", "K")

        local function clear_progress()
            if clear_timer then clear_timer:stop(); clear_timer = nil end
            -- 這裡發送終端控制序列
            vim.api.nvim_ui_send("\027]9;4;0\027\\")
        end

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            },
            pyright = {
                settings = {
                    python = {
                        pythonPath = vim.fn.systemlist("which python")[1]
                    }
                },
            },
            clangd = {},
            jsonls = {},
            marksman = {},
            dockerls = {},
            docker_compose_language_service = {},
            bashls = {},
            taplo = {},
            texlab = {},
        }

        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then desc = 'LSP: ' .. desc end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
            nmap('<leader>rn', "<cmd>Lspsaga rename ++project<cr>", '[R]e[n]ame')
            nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
            nmap('<leader>k', function()
                vim.lsp.buf.signature_help({ border = "rounded" })
            end, 'Signature Documentation')
            nmap("<space>f", function()
                vim.lsp.buf.format { async = true }
            end, "[F]ormat code")
        end

        require("neoconf").setup()
        require("lspsaga").setup()
        require("mason").setup()

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        for server, config in pairs(servers) do
            local final_opts = vim.tbl_deep_extend("keep",
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                },
                config
            )
            vim.lsp.config(server, final_opts)
            vim.lsp.enable(server)
        end

        -- 將 Autocmd 放在 config 函數內部，確保變數可存取
        vim.api.nvim_create_autocmd("LspProgress", {
            callback = function(ev)
                local value = ev.data.params.value
                if clear_timer then clear_timer:stop(); clear_timer = nil end

                if value.kind == "begin" then
                    active_count = active_count + 1
                    local pct = value.percentage or 3
                    vim.api.nvim_ui_send(string.format("\027]9;4;1;%d\027\\", pct))
                elseif value.kind == "report" then
                    if value.percentage then
                        vim.api.nvim_ui_send(string.format("\027]9;4;1;%d\027\\", value.percentage))
                    end
                elseif value.kind == "end" then
                    active_count = math.max(0, active_count - 1)
                    if active_count == 0 then
                        vim.api.nvim_ui_send("\027]9;4;1;100\027\\")
                        clear_timer = vim.uv.new_timer()
                        clear_timer:start(1500, 0, vim.schedule_wrap(clear_progress))
                    end
                end
            end,
        })

        -- UI Colors
        vim.api.nvim_set_hl(0, "SagaBorder", { fg = "#7aa2f7", bg = "NONE" })
        vim.api.nvim_set_hl(0, "SagaNormal", { bg = "NONE" })
    end
}
