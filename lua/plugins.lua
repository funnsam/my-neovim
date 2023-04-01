-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'romgrk/barbar.nvim'
	use 'navarasu/onedark.nvim'
	
	use {'neoclide/coc.nvim', branch = 'release'}

	use 'nvim-tree/nvim-tree.lua'
end)
