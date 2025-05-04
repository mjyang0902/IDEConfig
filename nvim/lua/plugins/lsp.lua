return {
    "neovim/nvim-lspconfig",
    cmd = { "Mason", "Neoconf" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
        "folke/neoconf.nvim",
        "folke/neodev.nvim",
        {
            "j-hui/fidget.nvim",
            tag = "legacy",
        },
        "nvimdev/lspsaga.nvim",
        'folke/lsp-colors.nvim',
    },
    config = function()
        vim.diagnostic.config({
            underline = false
        })
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
            -- ocamllsp = {},
            taplo = {},
            texlab = {},
        }
        local handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                focusable = false, -- Prevents the hover from stealing focus
            }),
            -- ["textDocument/publishDiagnostics"] = function() end
            ["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                    underline = false,
                    undercurl = false,
                    virtual_text = false,
                    signs = false
                }
            )
        }
        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('gd', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
            -- nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
            nmap('gi', require "telescope.builtin".lsp_implementations, '[G]oto [I]mplementation')
            nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>rn', "<cmd>Lspaga rename ++project<cr>", '[R]e[n]ame')
            nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
            nmap('<leader>da', require "telescope.builtin".diagnostics, '[D]i[A]gnostics')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            --nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
            nmap("<space>f", function()
                vim.lsp.buf.format { async = true }
            end, "[F]ormat code")
        end


        require("neoconf").setup()
        require("neodev").setup()
        require("fidget").setup({
            notification = {
                window = {
                    winblend = 10,
                },
            }
        })
        require("lspsaga").setup()
        require("mason").setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })
        require("lsp-colors").setup({
            Error = "#db4b4b",
            Warning = "#e0af68",
            Information = "#0db9d7",
            Hint = "#10B981"
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
    end
}
