vim.api.nvim_set_keymap("n", "<C-x>", "", { noremap = true, silent = true, callback = require("hex").toggle })

return { "RaafatTurki/hex.nvim" }
