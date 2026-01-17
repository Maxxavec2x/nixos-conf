{ pkgs, ... }:
let unstable = import <unstable> {};
in
{
  # Active hyprland en mode instable (parce que la branche stable est trop vieille)
  programs.hyprland = {
    enable = true;
    package = unstable.hyprland;
    withUWSM = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  environment.systemPackages = with unstable; [
    hyprcursor
    hyprlock
    hyprpaper
  ];
}
