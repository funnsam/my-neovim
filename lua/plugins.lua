return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-tree/nvim-web-devicons"

    use "nvim-lualine/lualine.nvim" -- status bar
    use "romgrk/barbar.nvim" -- tabs
    use { "catppuccin/nvim", as = "catppuccin" } -- theme

    use "nvim-tree/nvim-tree.lua" -- file tree

    use {
        "utilyre/barbecue.nvim", -- location bar
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
    }

    use {
        "folke/todo-comments.nvim", -- fancy comments
        requires = {
            "nvim-lua/plenary.nvim"
        },
    }

    use "akinsho/toggleterm.nvim" -- terminal
    use "mg979/vim-visual-multi" -- multi-cursor
    use "ollykel/v-vim"

    use "williamboman/mason.nvim" -- LSPs
    use "neovim/nvim-lspconfig" -- lsp config
    use "williamboman/mason-lspconfig.nvim" -- mason lsp shit

    use "hrsh7th/nvim-cmp" -- autocomplete
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"

    use "andweeb/presence.nvim" -- discord

    use "RaafatTurki/hex.nvim" -- hex editor
end)
