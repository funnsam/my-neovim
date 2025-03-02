return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        term_colors = true,
        styles = {
            comments = {},
            conditionals = {},
        },
        integrations = {
            barbar = true,
            barbecue = {},
            mason = true,
            native_lsp = {
                virtual_text = {
                    errors = {},
                    hints = {},
                    warnings = {},
                    information = {},
                    ok = {},
                },
            },
        },
    }
}
