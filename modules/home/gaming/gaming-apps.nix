{ inputs, ... }:
{
  flake.homeModules.gaming-apps =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        appimage-run # pour démarrer les appimages
        protonup-qt
        bottles
        heroic
        #lutris
        #wineWowPackages.stable
        winetricks
        #wineWowPackages.waylandFull

        qbittorrent # ;)

        # to stream my pc for gaming:
        moonlight-qt

        # minecraft
        prismlauncher

        # wallpaper engine (steam app for animated wallpaper)
        linux-wallpaperengine
        inputs.linux-wallpaperengine-gui.packages.${pkgs.system}.default
      ];
    };
}
