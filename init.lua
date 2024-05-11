vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.opt.completeopt = {"menuone", "noselect", "noinsert"}
vim.opt.shortmess = vim.opt.shortmess + {c = true}
vim.api.nvim_set_option("updatetime", 300)

vim.cmd([[
    set list
    set lcs=leadmultispace:│\ \ \ ,trail:_,tab:@@
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

-- theme
require("onedark").setup {
    code_style = {
        comments = "none"
    }
}
require("onedark").load()

-- location bar
require("barbecue").setup {
    theme = "onedark",
}

-- status bar
local a = { left = "", right = "" }
local b = { right = a.left }
require("lualine").setup {
    options = {
        theme = "onedark",
        globalstatus = true,
        component_separators = "|",
        section_separators = a,
    },
    sections = {
        lualine_a = {{"mode", separator = b}},
        lualine_b = {{"branch"}},
        lualine_c = {{"filename"}, {"diagnostics"}},
        lualine_x = {{"diff"}, {"filetype"}},
        lualine_y = {{"progress"}},
        lualine_z = {{"location"}}
    },
}

-- tabs
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

-- file tree
require("nvim-tree").setup()
map("n", "<C-b>", "<Cmd>NvimTreeToggle<CR>", opts)
vim.cmd("NvimTreeOpen")

-- terminal
local shell = vim.o.shell;
if vim.loop.os_uname().sysname == "Linux" then
    shell = "/usr/bin/bash"
end

require("toggleterm").setup({
    shell = shell
})

vim.keymap.set("n", "<C-C>", "<CMD>ToggleTerm size=7<CR>", {silent = true})

-- Todo comments
require("todo-comments").setup({
    keywords = {
        LIGHT = { icon = "", color = "#abb2bf" }
    }
})

-- column colors
vim.keymap.set("n", ".", "<CMD>set cc=<CR>", {silent = true})
vim.keymap.set("n", ",", "<CMD>set cc=100<CR>", {silent = true})
vim.cmd([[
    highlight ColorColumn guibg=#e86671
]])

-- autocomplete
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSPs
require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").rust_analyzer.setup({
    capabilities = capabilities,
})

require("lspconfig").html.setup({
    capabilities = capabilities,
})

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end

-- discord
require("presence").setup({
    main_image = "file",
})
