-- Plugin pour ajouter des infos liés au rust
return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          client.server_capabilities.inlayHintProvider = false
        end,
      },
    }
  end,
}
