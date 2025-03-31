---[[HOW TO USE IT?
--- 0. Install neovim 0.11
--- 1. Create ~/.config/nvim-experiments directory on your machine (Assuming you are using Linux)
--- 2. Copy this init.lua into the nvim-experiments directory
--- 3. Launch neovim using `NVIM_APPNAME=nvim-experiments nvim` command
--- 4. Install requiring lsp servers via mason (type `:Mason`), relaunch neovim, and open your project to test it
--- 5. You may want to install treesitter parsers to get documentation
--- highlighting for some languages
---]]

---[[ Lazy.nvim package manager bootstrap and some essential plugins installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        spec = "ssc.plugins",
        change_detection = { notify = false },
})
ColorNvim("kanagawa")
