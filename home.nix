{ pkgs, ... }:

{
  home.username = "maxx";
  home.homeDirectory = "/home/maxx";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  programs.waybar.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings.misc.disable_watchdog_warning = true; # A enlever quand le problème de uwsm.desktop sera réglé
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };
  xdg.configFile."hypr/monitors.conf".source = ./hypr/monitors.conf;
  xdg.configFile."hypr/inputs.conf".source = ./hypr/inputs.conf;
  xdg.configFile."hypr/workspaces.conf".source = ./hypr/workspaces.conf;
  xdg.configFile."hypr/look.conf".source = ./hypr/look.conf;
  xdg.configFile."hypr/windows-rules.conf".source = ./hypr/windows-rules.conf;
  xdg.configFile."hypr/keybinding.conf".source = ./hypr/keybinding.conf;
}

