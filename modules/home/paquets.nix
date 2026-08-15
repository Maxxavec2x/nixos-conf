{ ... }:
{
  # Ce fichier décrits les packets qui n'ont pas besoin de configurations particulières
  flake.homeModules.paquets =

    { pkgs, ... }:

    {
      # Les différents packages accessible à mon user
      home.packages = with pkgs; [
        # Utilitaires
        git
        wget
        vim
        tree
        file
        fastfetch
        fzf
        bat
        jq
        gcc
        baobab # disk usage analyser dans le launcher
        #grimblast # capture d'écran
        #dunst # notification daemon
        nwg-displays
        brightnessctl
        kdePackages.okular
        unzip
        simple-scan # Pour scanner
        # Suite bureautique :
        onlyoffice-desktopeditors

        # Shell
        wl-clipboard # permet de pipe pour copier, genre "cat file |wl-copy"
        glow # Pour afficher les fichiers md dans le terminal.

        # Communication
        vesktop # discord gui client

        # Mail
        thunderbird

        # man pages :
        man-pages
        man-pages-posix

        # permet de créer des conteneurs d'autre distros; utile quand nixos casse les couilles
        distrobox

        # Permet de download des video youtubes (utile pour un plugin)
        yt-dlp
      ];
    };
}
