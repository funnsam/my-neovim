local a = { left = "", right = "" }
local b = { right = a.left }

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            globalstatus = true,
            component_separators = "|",
            section_separators = a,
        },
        sections = {
            lualine_a = {{ "mode", separator = b }},
            lualine_b = {{"branch"}},
            lualine_c = {{"filename"}, {"diagnostics"}},
            lualine_x = {{"diff"}, {"filetype"}},
            lualine_y = {{"progress"}},
            lualine_z = {{"location"}}
        },
    }
}
