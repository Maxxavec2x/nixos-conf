# Conf librewolf
{
  flake.homeModules.librewolf =
    { ... }:
    {
      programs.librewolf = {
        enable = true;
        settings = {
          "privacy.resistFingerprinting" = false;
          "webgl.disabled" = false;
        };
      };
    };
}
