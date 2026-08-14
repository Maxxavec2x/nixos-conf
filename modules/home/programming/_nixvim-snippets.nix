# snippets pour nixvim

''
  local ls = require("luasnip")
  local s = ls.snippet
  local t = ls.text_node
  local i = ls.insert_node
  local fmt = require("luasnip.extras.fmt").fmt

  ls.add_snippets("nix", {
    s("hmmodule", fmt([[
      # Conf {}
      {{ inputs, ... }}:
      {{
        flake.homeModules.{} =
          {{ pkgs, ... }}:
          {{
            {}
          }};
      }}
    ]], { i(1, "nom"), i(2, "nomModule"), i(3) })),
  })

  vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.jumpable(1) then ls.jump(1) end
  end, { desc = "Snippet: next placeholder" })

  vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if ls.jumpable(-1) then ls.jump(-1) end
  end, { desc = "Snippet: previous placeholder" })

''
