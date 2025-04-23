return{
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.ui.calendar"] = {},
                ["core.summary"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/personal/org/notes",
                            school = "~/personal/org/school",
                        },
                        default_workspace = "notes",
                    },
                },
                ["core.keybinds"] = {
                    config = {
                        default_keybinds = true,
                        vim.api.nvim_create_autocmd("Filetype", {
                            pattern = "norg",
                            callback = function()
                                vim.keymap.set("n", "<LocalLeader>ip", "<Plug>(neorg.tempus.insert-date.insert-mode)", { buffer = true })
                            end,
                        })
                    },
                },
                ["core.export"] = {
                    config = {
                        export_dir = "~/personal/org/exports",
                    },
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
            },
        }

        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
    end,
}
