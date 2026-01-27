local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("mkshell", {
    t({
      "{ pkgs ? import <nixpkgs> {} }:",
      "",
      "",
      "pkgs.mkShell {",
      "  packages = with pkgs; [",
      "    ",
    }),
    i(1, "# add packages here"),
    t({
      "",
      "  ];",
      "  # env.foo = \"bar\";",
      "}",
    }),
    i(0),
  }),
}

