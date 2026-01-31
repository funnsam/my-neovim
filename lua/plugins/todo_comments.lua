return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        highlight = {
            multiline_pattern = "^.?",
        },
        keywords = {
            LIGHT = { icon = "", color = "norm" },
            MATH = { icon = "󰍘", color = "math" },
            SAFETY = { icon = "", color = "warning" },
        },
        colors = {
            norm = { "Normal" },
            math = { "@property", "#73daca" },
        },
    }
}
