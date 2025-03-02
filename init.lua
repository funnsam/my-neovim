vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 300)

vim.cmd([[
    set list
    set lcs=leadmultispace:│\ \ \ ,trail:_,tab:│\ 
]])

vim.keymap.set("n", ".", "<CMD>set cc=<CR>", { silent = true })
vim.keymap.set("n", ",", "<CMD>set cc=100<CR>", { silent = true })
vim.cmd.highlight("ColorColumn guibg=#e86671")

require("config.lazy")

vim.cmd.colorscheme("catppuccin")
