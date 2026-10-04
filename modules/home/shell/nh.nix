# Conf nh (cli utility pour gérer nixos) : https://github.com/nix-community/nh
{ ... }:
{
  flake.homeModules.nh =
    { ... }:
    {
      programs.nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 3";
        osFlake = "/home/maxx/nixos-flake-conf/"; # sets NH_OS_FLAKE variable for you
      };
    };
}
