local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "ssc.plugins",
    change_detection = { notify = false },
})

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

ColorNvim("rose-pine-moon")
