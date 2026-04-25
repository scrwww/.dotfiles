return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "L3MON4D3/LuaSnip",
        "j-hui/fidget.nvim",
    },
    config = function()
        local capabilities = require('ssc.capabilities').get_lsp_capabilities()

        -- FIDGET
        require("fidget").setup({})
        -- MASON
        require("mason").setup()


        -- LSP
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
            },

            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = {"bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        -- DIAGNOSTICS
        vim.diagnostic.config({
            update_in_insert = false,
            float = {
                focusable = false,
                style = "minimal",
                border = "",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
