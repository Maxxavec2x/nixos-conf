-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.clipboard = "unnamedplus"

-- Option spécifique pour nixos, pour éviter d'utiliser le binaire statically linked
vim.g.lazyvim_prefer_local_treesitter = true
vim.g.treesitter_cli = "tree-sitter"

