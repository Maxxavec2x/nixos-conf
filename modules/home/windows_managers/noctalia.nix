{ inputs, ... }:
{
  flake.homeModules.noctalia-homeModule =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      imports = [ inputs.noctalia.homeModules.default ];
      programs.noctalia = {
        enable = true;
      };
      xdg.configFile."noctalia".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-flake-conf/modules/home/windows_manager/noctalia";
    };
}
