-- function SetTheme(color)
--     vim.cmd('set termguicolors')
--     if color ~= nil then
--         vim.cmd.colorscheme(color)
--     else
--         vim.cmd.colorscheme("habamax")
--     end
--     --    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     --    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end

return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config=function ()
            vim.cmd.colorscheme("tokyonight-moon")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
    },
    {
        "slugbyte/lackluster.nvim",
    },
    {
        "folke/tokyonight.nvim",
    },
    {
        "rose-pine/neovim",
    },
}
