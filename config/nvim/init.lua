-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Pour pouvoir sortir du terminal avec escape
vim.api.nvim_set_keymap("t", "<Leader><ESC>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
