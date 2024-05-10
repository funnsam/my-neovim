return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"
	use "nvim-lualine/lualine.nvim"
	use "nvim-tree/nvim-web-devicons"
	use "romgrk/barbar.nvim"
	use "navarasu/onedark.nvim"

	use {"neoclide/coc.nvim", branch = "release"}

	use "nvim-tree/nvim-tree.lua"

	use {
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
	}

	use {
		"folke/todo-comments.nvim",
		requires = {
			"nvim-lua/plenary.nvim"
		},
	}

	use "akinsho/toggleterm.nvim"
	use "mg979/vim-visual-multi"
	use "ollykel/v-vim"
end)
