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

  # Waybar applet
    networkmanagerapplet

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

  # file managers:
    kdePackages.dolphin # Voir https://wiki.nixos.org/wiki/Dolphin pour les plugins en dessous
    kdePackages.qtsvg # Pour les icones de dolphin
    kdePackages.kio # needed since 25.11
    kdePackages.kio-fuse #to mount remote filesystems via FUSE
    kdePackages.kio-extras #extra protocols support (sftp, fish and more)
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
