{ pkgs, ... }:

{
  home.username = "maxx";
  home.homeDirectory = "/home/maxx";
  home.stateVersion = "25.11";
  home.file.".zshrc".source = ./config/.zshrc;  # Sourcing du zshrc
  programs.home-manager.enable = true;
  programs.waybar.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings.misc.disable_watchdog_warning = true; # A enlever quand le problème de uwsm.desktop sera réglé
    extraConfig = builtins.readFile ./config/hypr/hyprland.conf;
  };

  #conf hyprland
  xdg.configFile."hypr/monitors.conf".source = ./config/hypr/monitors.conf;
  xdg.configFile."hypr/inputs.conf".source = ./config/hypr/inputs.conf;
  xdg.configFile."hypr/workspaces.conf".source = ./config/hypr/workspaces.conf;
  xdg.configFile."hypr/look.conf".source = ./config/hypr/look.conf;
  xdg.configFile."hypr/windows-rules.conf".source = ./config/hypr/windows-rules.conf;
  xdg.configFile."hypr/keybinding.conf".source = ./config/hypr/keybinding.conf;
  xdg.configFile."hypr/hyprlauncher.conf".source = ./config/hypr/hyprlauncher.conf;
  xdg.configFile."hypr/xdph.conf".source = ./config/hypr/xdph.conf;

 # conf waybar
  xdg.configFile."waybar/config.jsonc".source = ./config/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ./config/waybar/style.css;
  xdg.configFile."waybar/scripts".source = ./config/waybar/scripts;

  # conf kitty
  xdg.configFile."kitty".source = ./config/kitty;

  # conf nvim
  xdg.configFile."nvim".source = ./config/nvim;
  programs.neovim = {
  enable = true;
  withNodeJs = true;
  extraPackages = with pkgs; [
    tree-sitter
  ];
};

}

