# Conf btop
{ ... }:
{
  flake.homeModules.btop =
    { pkgs, ... }:
    {
      programs.btop = {
        enable = true;
        package = pkgs.btop-rocm;
        settings = {
          vim_keys = true;
          color_theme = "noctalia";
        };
      };
    };
}
