-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Pour pouvoir sortir du terminal avec escape
vim.api.nvim_set_keymap("t", "<Leader><ESC>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- Pour pouvoir copy paste en ssh :
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
vim.opt.clipboard = "unnamedplus"

