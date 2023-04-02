return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"
	use "nvim-lualine/lualine.nvim"
	use "nvim-tree/nvim-web-devicons"
	use "romgrk/barbar.nvim"
	use "navarasu/onedark.nvim"
	
	use {"neoclide/coc.nvim", branch = "release"}

	use "nvim-tree/nvim-tree.lua"

	use "sunjon/shade.nvim"

	use {
  		"utilyre/barbecue.nvim",
  		tag = "*",
  		requires = {
    		"SmiteshP/nvim-navic",
    		"nvim-tree/nvim-web-devicons", -- optional dependency
 		},
	}

	use "akinsho/toggleterm.nvim"
end)
