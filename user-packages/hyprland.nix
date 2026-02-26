{pkgs, nixosConfig, ...}:

{
  programs.waybar.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      misc.disable_watchdog_warning = true; # A enlever quand le problème de uwsm.desktop sera réglé
      input.sensitivity = nixosConfig.appareil.sensitivity;
    };
    extraConfig = builtins.readFile ../config/hypr/hyprland.conf;
  };
}

