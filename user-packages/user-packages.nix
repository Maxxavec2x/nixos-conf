{pkgs, nixosConfig, ...}:

{
 # Les différents packages accessible à mon user
  home.packages = with pkgs; [
  # Utilitaires
    tree
    file
    fastfetch
    fzf
    btop-rocm
    bat
    gcc 
    baobab # disk usage analyser dans le launcher
    grimblast # capture d'écran
    dunst # notification daemon
    nwg-displays
    brightnessctl
    kdePackages.okular
    unzip
    simple-scan # Pour scanner
  # Waybar applet
    networkmanagerapplet
  # Suite bureautique :
    onlyoffice-desktopeditors

  # Shell
    starship
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

  # notes
    obsidian
    notion-app-enhanced 
  # minecraft
    prismlauncher

  # man pages :
    man-pages
    man-pages-posix
  ];

  programs.home-manager.enable = true;

  programs.neovim = {
    defaultEditor = true;
    enable = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
    tree-sitter
    ];
  };
}
