{pkgs, ...}:

{
 # Les différents packages accessible à mon user
  home.packages = with pkgs; [
  # Utilitaires
    tree
    file
    fastfetch
    fzf
    btop
    bat
    gcc 
    baobab # disk usage analyser dans le launcher
    grimblast # capture d'écran
    dunst # notification daemon
    nwg-displays

  # Waybar applet
    networkmanagerapplet

  # Shell
    starship
    oh-my-zsh
    glow # Pour afficher les fichiers md dans le terminal.

  # Wallpaper
    waypaper
    swww

  # Lockscreen/exit menus
    hyprlock
    wlogout

  # Home manager
    home-manager

  # App launcher
    fuzzel

  # Communication
    vesktop

  # Mail
    thunderbird
  ];

  programs.home-manager.enable = true;
  programs.waybar.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings.misc.disable_watchdog_warning = true; # A enlever quand le problème de uwsm.desktop sera réglé
    extraConfig = builtins.readFile ../config/hypr/hyprland.conf;
  };

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
    tree-sitter
    ];
  };
}
