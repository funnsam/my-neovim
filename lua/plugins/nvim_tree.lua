vim.api.nvim_set_keymap("n", "<C-b>", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

return { "nvim-tree/nvim-tree.lua", opts = {} }
