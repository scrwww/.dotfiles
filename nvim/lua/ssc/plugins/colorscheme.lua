function ColorNvim(color)
    vim.cmd('set termguicolors')
    if color ~= nil then
        vim.cmd.colorscheme(color)
    else
    vim.cmd.colorscheme("habamax")
    end
--    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "Vallen217/eidolon.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        ColorNvim("eidolon")
    end,
}
