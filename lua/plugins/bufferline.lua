return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map('n', '<A-h>', '<Cmd>BufferLineCyclePrev<CR>', opts)
        map('n', '<A-l>', '<Cmd>BufferLineCycleNext<CR>', opts)

        map('n', '<A-H>', '<Cmd>BufferLineMovePrev<CR>', opts)
        map('n', '<A-L>', '<Cmd>BufferLineMoveNext<CR>', opts)

        map('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
        map('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
        map('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
        map('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
        map('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
        map('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
        map('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
        map('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
        map('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)
        map('n', '<A-0>', '<Cmd>BufferLinePick<CR>', opts)

        map('n', '<A-q>', '<Cmd>bdelete<CR>', opts)
        map('n', '<A-Q>', '<Cmd>bdelete!<CR>', opts)

        map('n', '<A-C>', '<Cmd>BufferLineCloseOthers<CR>', opts)

        require("bufferline").setup({
            options = {
                numbers = "ordinal",
                diagnostics = "nvim_lsp",
            }
        })
    end,
}
