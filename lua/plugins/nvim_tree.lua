vim.api.nvim_set_keymap("n", "<C-b>", "<Cmd>NvimTreeToggle<CR>", { silent = true })

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}
}
