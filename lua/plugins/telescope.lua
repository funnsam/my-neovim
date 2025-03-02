return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require("telescope")
        telescope.setup({})

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { noremap = true, silent = true })
    end,
}
