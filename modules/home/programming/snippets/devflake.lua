local ls = require("luasnip")
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return ls.snippet(
  "devflake",
  fmt(
    [[
{{
  description = "Development environment for {}";

  inputs = {{
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  }};

  outputs = {{ self, nixpkgs, flake-utils }}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {{ inherit system; }};
      in
      {{
        devShells.default = pkgs.mkShell {{
          packages = with pkgs; [
            {}
          ];

          shellHook = ''
            Dev-shell ready !
          '';
        }};
      }});
}}
]],
    { i(1, "nom-du-projet"), i(2)}
  )
)
