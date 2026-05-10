{pkgs, ...}:
{
  home.packages = with pkgs; [
  # file managers:
    kdePackages.dolphin # Voir https://wiki.nixos.org/wiki/Dolphin pour les plugins en dessous
    kdePackages.qtsvg # Pour les icones de dolphin
    kdePackages.kio # needed since 25.11
    kdePackages.kio-fuse #to mount remote filesystems via FUSE
    kdePackages.kio-extras #extra protocols support (sftp, fish and more)
  ];

  xdg.configFile."kdeglobals".text = ''
  [General]
  TerminalApplication=kitty
  '';

  xdg.dataFile."kio/servicemenus/openkitty.desktop".text = ''
    [Desktop Entry]
    Type=Service
    MimeType=inode/directory;
    Actions=openKitty
    X-KDE-ServiceTypes=KonqPopupMenu/Plugin

    [Desktop Action openKitty]
    Name=Open Kitty Here
    Icon=kitty
    Exec=kitty --directory %f
  '';
}
