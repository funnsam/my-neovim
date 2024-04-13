vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.completeopt = {"menuone", "noselect", "noinsert"}
vim.opt.shortmess = vim.opt.shortmess + {c = true}
vim.api.nvim_set_option("updatetime", 300)

vim.cmd([[
	set list
	set lcs=tab:→\ ,space:·,trail:#
]])

require("plugins")

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile | PackerInstall
	augroup end
]])

vim.cmd([[
	set signcolumn=yes
	autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.cmd([[
	map <MiddleMouse> <Nop>
	imap <MiddleMouse> <Nop>
	map <2-MiddleMouse> <Nop>
	imap <2-MiddleMouse> <Nop>
]])

-- Theme
require("onedark").setup {
	code_style = {
		comments = "none"
	}
}
require("onedark").load()

-- Depth bar
require("barbecue").setup()

-- Status bar
local a = { left = "", right = "" }
local b = { left = "", right = "" }
require("lualine").setup {
	options = {
		theme = "onedark",
		globalstatus = true,
		component_separators = "|",
		section_separators = a,
	},
	sections = {
		lualine_a = {{"mode" 	, separator = b}},
		lualine_b = {{"branch" 	}},
		lualine_c = {{"filename"}, {"diagnostics"}},
		lualine_x = {{"diff"}, {"filetype"}},
		lualine_y = {{"progress"}},
		lualine_z = {{"location", separator = b}}
	},
}

-- Tab list
require("barbar").setup {
	icons = {
		button = "󰅖",
		pinned = { button = "󰐃", filename = true }
	}
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- File list
require("nvim-tree").setup()
map("n", "<C-b>", "<Cmd>NvimTreeToggle<CR>", opts)
vim.cmd("NvimTreeOpen")

-- Coc
local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There"s always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ":verbose imap <tab>" to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? \"<TAB>\" : coc#refresh()", opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Use K to show documentation in preview window
function _G.show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
    end
end
keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", {silent = true})

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
	group = "CocGroup",
	command = "silent call CocActionAsync(\"highlight\")",
	desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming
keyset("n", "<F2>", "<Plug>(coc-rename)", {silent = true})

-- Terminal
local shell = vim.o.shell;
if vim.loop.os_uname().sysname == "Linux" then
	shell = "/usr/bin/bash"
end
require("toggleterm").setup({
	shell = shell
})
keyset("n", "<C-C>", "<CMD>ToggleTerm size=7<CR>", {silent = true})

-- Todo comments
require("todo-comments").setup({
	keywords = {
		LIGHT = { icon = "", color = "#abb2bf" }
	}
})

-- Column colors
keyset("n", ".", "<CMD>set cc=<CR>", {silent = true})
keyset("n", ",", "<CMD>set cc=100<CR>", {silent = true})
vim.cmd([[
	highlight ColorColumn guibg=Red
]])
