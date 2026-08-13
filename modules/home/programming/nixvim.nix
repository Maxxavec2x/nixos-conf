# Conf neovim
{ inputs, ... }:
{
  flake.homeModules.nixvim =
    { pkgs, ... }:
    {
      imports = [
        inputs.nixvim.homeModules.nixvim
      ];
      programs.nixvim = {
        enable = true;
        defaultEditor = true;

        # Treesitter : parsing/highlighting
        plugins.treesitter = {
          enable = true;
          settings = {
            highlight.enable = true;
            indent.enable = true;
          };
        };

        # LSP pour Nix
        plugins.lsp = {
          enable = true;
          servers = {
            nixd.enable = true;
          };
        };

        # Formatage automatique à la sauvegarde
        plugins.conform-nvim = {
          enable = true;
          settings = {
            formatters_by_ft = {
              nix = [ "nixfmt" ];
            };
            format_on_save = {
              timeout_ms = 500;
              lsp_format = "fallback";
            };
          };
        };

        extraPackages = with pkgs; [
          nixfmt
        ];
      };
    };
}
