return {
    "funnsam/grass.nvim",
    -- dir = "~/Projects/personal/grass.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("grass")
    end,
}
