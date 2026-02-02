local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("mkshellrs", {
    t({
      "{ pkgs ? import <nixpkgs> {} }:",
      "",
      "",
      "pkgs.mkShell {",
      "  packages = with pkgs; [",
      "    cargo",
      "    rustc",
      "    rust-analyzer",
      "    rustfmt",
      "",
      "    # Pour cargo / crates natives",
      "    pkg-config",
      "    openssl",
      "    clang",
      "",
      "    ",
    }),
    i(1),
    t({
      "",
      "  ];",
      "",
      "  # env.foo = \"bar\";",
      "}",
    }),
    i(0),
  }),
}

