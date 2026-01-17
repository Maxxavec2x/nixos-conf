-- Dans n'importe quel fichier de ta config, par exemple :
-- ~/.config/nvim/lua/plugins/cargo.lua   ou   ~/.config/nvim/lua/plugins/rust.lua

return {
  "nwiizo/cargo.nvim",
  ft = "rust", -- charge seulement sur les .rs
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("cargo").setup({})

    local map = vim.keymap.set

    map("n", "<leader>rr", "<cmd>CargoRun<cr>", { desc = "cargo run (buffer flottant)" })
    map("n", "<leader>rt", "<cmd>CargoRunTerm<cr>", { desc = "cargo run (terminal en bas)" })
    map("n", "<leader>rc", "<cmd>CargoCheck<cr>", { desc = "cargo check" })
    map("n", "<leader>rb", "<cmd>CargoBuild<cr>", { desc = "cargo build" })
    map("n", "<leader>rx", "<cmd>CargoTest<cr>", { desc = "cargo test" })

    map("n", "rt", "<cmd>CargoRun<cr>", { desc = "cargo run (sans terminal)" })
    map("n", "rr", "<cmd>CargoRunTerm<cr>", { desc = "cargo run" })
    map("n", "rc", "<cmd>CargoCheck<cr>", { desc = "cargo check" })
  end,
}
