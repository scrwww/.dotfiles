return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require('telescope').setup({
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        })

        local builtin = require('telescope.builtin')
        -- FIND THOSE FILES 
        vim.keymap.set('n', '<leader>fs', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fws', function()
        vim.keymap.set('n', '<leader>fg', function()
            builtin.grep_string({ search = vim.fn.input("Grep: ") })
        end)
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>fWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        -- Get some help
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}

