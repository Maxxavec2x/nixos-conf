{ inputs, ... }:
{
  flake.homeModules.gaming-apps =
    { pkgs, ... }:
    {
      programs.mangohud = {
        enable = true;
        settings = {
          gpu_name = true;
          gpu_list = "0,1";
        };
      };
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
        inputs.linux-wallpaperengine-gui.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
