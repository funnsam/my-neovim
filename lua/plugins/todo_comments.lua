return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        keywords = {
            LIGHT = { icon = "", color = "norm" },
            SAFETY = { icon = "", color = "warning" },
        },
        colors = {
            norm = { "Normal" },
        },
    }
}
