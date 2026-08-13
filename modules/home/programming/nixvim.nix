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
        nixpkgs.source = inputs.nixpkgs;
        enable = true;
        defaultEditor = true;
        diagnostic.settings = {
          virtual_text = true;
        };
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

        # Pour la complétion
        plugins.blink-cmp = {
          enable = true;
          settings = {
            keymap.preset = "super-tab"; # Tab/Ctrl-y pour valider
            appearance = {
              nerd_font_variant = "mono";
            };
            sources = {
              default = [
                "lsp"
                "path"
                "snippets"
                "buffer"
              ];
            };
          };
        };

        extraPackages = with pkgs; [
          nixfmt
        ];
      };
    };
}
