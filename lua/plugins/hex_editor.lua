vim.keymap.set("n", "<C-x>", function() require("hex").toggle() end, { noremap = true, silent = true })

return { "RaafatTurki/hex.nvim" }
