{ config, pkgs, ... }:

let
  unstable = import <unstable> { system = pkgs.stdenv.hostPlatform.system; };
in
{
  nixpkgs.overlays = [
    (final: prev: {
      hyprland = unstable.hyprland;
      hyprcursor = unstable.hyprcursor;
      hyprlock = unstable.hyprlock;
      hyprpaper = unstable.hyprpaper;
      aquamarine = unstable.aquamarine;
      hyprutils = unstable.hyprutils;
      hyprgraphics = unstable.hyprgraphics;
      hyprlang = unstable.hyprlang;
    })
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  programs.hyprland = {
    enable = true;
    withUWSM = true;
 };
}

