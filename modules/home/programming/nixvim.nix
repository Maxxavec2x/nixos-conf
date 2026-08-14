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
        opts = {
          number = true;
          relativenumber = true;
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
          clipboard = "unnamedplus";
        };
        diagnostic.settings = {
          virtual_text = true;
        };

        colorschemes.catppuccin = {
          enable = true;
          settings = {
            flavour = "mocha";
          };
        };

        plugins.friendly-snippets.enable = true;

        # Treesitter : parsing/highlighting
        plugins.treesitter = {
          enable = true;
          settings = {
            highlight.enable = true;
            indent.enable = true;
          };
          grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
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
            snippets = {
              preset = "luasnip";
            };
          };
        };

        globals.mapleader = " ";
        keymaps = [
          {
            mode = "n";
            key = "<leader>ca";
            action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
            options.desc = "Code action (fix)";
          }
        ];
        # Plugin pour fuzzy find les fichiers ou le texte
        plugins.telescope = {
          enable = true;
          keymaps = {
            "<leader><leader>" = {
              action = "find_files";
              options.desc = "Find files";
            };
            "<leader>fg" = {
              action = "live_grep";
              options.desc = "Grep in project";
            };
          };
        };

        # Plugin pour avoir le menu contextuel d'aide pour les keymap:
        plugins.which-key = {
          enable = true;
        };

        # custom snippets
        plugins.luasnip = {
          enable = true;
          settings = {
            enable_autosnippets = true;
          };
        };

        extraConfigLua = import ./_nixvim-snippets.nix;
        extraPackages = with pkgs; [
          ripgrep
          nixfmt
          nerd-fonts.jetbrains-mono
          wl-clipboard
        ];
      };
    };
}
