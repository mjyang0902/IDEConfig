return {
    "neovim/nvim-lspconfig",
    cmd = { "Mason", "Neoconf" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
        "folke/neoconf.nvim",
        "folke/neodev.nvim",
        "nvimdev/lspsaga.nvim",
    },
    config = function()
        vim.diagnostic.config({
            underline = false
        })

        pcall(vim.keymap.del, "n", "K")

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
            volar = {},
            dockerls = {},
            docker_compose_language_service = {},
            bashls = {},
            taplo = {},
            texlab = {},
        }

        local handlers = {
            ["textDocument/hover"] = function(_, result, ctx, config) end,
            ["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                    underline = false,
                    undercurl = false,
                    virtual_text = false,
                    signs = false
                }
            ),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = "rounded",
            })
        }

        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('gd', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
            nmap('gi', require "telescope.builtin".lsp_implementations, '[G]oto [I]mplementation')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

            nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
            nmap('<leader>rn', "<cmd>Lspsaga rename ++project<cr>", '[R]e[n]ame')
            nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
            
            nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')
            nmap('<leader>da', require "telescope.builtin".diagnostics, '[D]i[A]gnostics')
            nmap("<space>f", function()
                vim.lsp.buf.format { async = true }
            end, "[F]ormat code")
        end

        require("neoconf").setup()
        require("neodev").setup()

        require("lspsaga").setup()

        require("mason").setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        for server, config in pairs(servers) do
            require("lspconfig")[server].setup(
                vim.tbl_deep_extend("keep",
                    {
                        handlers = handlers,
                        on_attach = on_attach,
                        capabilities = capabilities
                    },
                    config
                )
            )
        end

        vim.api.nvim_set_hl(0, "SagaBorder", { fg = "#7aa2f7", bg = "NONE" })
        vim.api.nvim_set_hl(0, "SagaNormal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    end
}
