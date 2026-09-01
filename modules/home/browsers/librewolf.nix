# Conf librewolf
{
  flake.homeModules.librewolf =
    { ... }:
    {
      programs.librewolf = {
        enable = true;
      };
    };
}
