vim.wo.number = true
vim.o.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        vim.o.tabstop = 4
        vim.o.shiftwidth = 4
    end,
})

vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.updatetime = 300

vim.cmd.set("list")
vim.opt.listchars = [[leadmultispace:│   ,trail:_,tab:│ ]]

vim.keymap.set("n", ".", "<CMD>set cc=<CR>", { silent = true })
vim.keymap.set("n", ",", "<CMD>set cc=100<CR>", { silent = true })
vim.cmd.highlight("ColorColumn guibg=#e86671")

require("config.lazy")

-- disable lsp highlight
vim.api.nvim_set_hl(0, '@lsp.type.function', {})
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end
