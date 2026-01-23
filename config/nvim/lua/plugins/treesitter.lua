-- Pour régler le problème nixos où neovim essaye d'executer un binaire statically linked
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = false,
  },
}

