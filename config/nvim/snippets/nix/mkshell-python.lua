local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("mkshellpy", {
    t({
      "{ pkgs ? import <nixpkgs> {} }:",
      "",
      "pkgs.mkShell {",
      "  packages = with pkgs; [",
      "    python311",
      "    python311Packages.pip",
      "    python311Packages.virtualenv",
      "    python311Packages.ipython",
      "  ];",
      "  # env.foo = \"bar\";",
      "}",
    }),
    i(0),
  }),
}

