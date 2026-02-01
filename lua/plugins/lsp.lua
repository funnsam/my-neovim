return {
    {
        "williamboman/mason.nvim",
        priority = 999,
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            vim.lsp.config("*", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            vim.lsp.config("rust_analyzer", {
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            features = "all",
                        },
                    },
                },
            })

            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
            })

            vim.lsp.config("zls", {
                settings = {
                    zls = {
                        semantic_tokens = "partial",
                    },
                },
            })

            vim.g.zig_fmt_parse_errors = 0
            vim.g.zig_fmt_autosave = 0
            vim.api.nvim_create_autocmd("BufWritePre",{
                pattern = {"*.zig", "*.zon"},
                callback = function(ev)
                    vim.lsp.buf.format()
                end
            })

            vim.lsp.inlay_hint.enable(true)
        end,
    }
}
