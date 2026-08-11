{
  flake.homeModules.zoxide =
    # Zoxide is a smarter cd (change directory) command that supports all major shells.
    # voir https://wiki.nixos.org/wiki/Zoxide
    #
    { ... }:
    {
      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = [
          "--cmd cd"
        ];
      };
    };
}
