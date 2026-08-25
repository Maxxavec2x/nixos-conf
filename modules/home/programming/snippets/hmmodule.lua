local ls = require("luasnip")
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return ls.snippet(
  "hmmodule",
  fmt(
    [[
# Conf {}
{{ inputs, ... }}:
{{
  flake.homeModules.{} =
    {{ pkgs, ... }}:
    {{
      {}
    }};
}}
]],
    { i(1, "nom"), i(2, "nomModule"), i(3) }
  )
)
