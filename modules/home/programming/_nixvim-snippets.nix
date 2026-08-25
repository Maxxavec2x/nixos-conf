{ lib }:
let
  snippetsDir = ./snippets;

  snippetFiles = builtins.attrNames (
    lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".lua" name) (
      builtins.readDir snippetsDir
    )
  );

  varName = file: lib.removeSuffix ".lua" file;

  loadSnippet = file: ''
    local ${varName file} = (function()
    ${builtins.readFile (snippetsDir + "/${file}")}
    end)();
  '';

  loadedSnippets = lib.concatMapStringsSep "\n" loadSnippet snippetFiles;
  snippetVars = lib.concatMapStringsSep ", " varName snippetFiles;
in
''
  local ls = require("luasnip")

  ${loadedSnippets}

  ls.add_snippets("nix", { ${snippetVars} });

  vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.jumpable(1) then
      ls.jump(1)
    end
  end, { desc = "Snippet: next placeholder" })

  vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { desc = "Snippet: previous placeholder" })
''
