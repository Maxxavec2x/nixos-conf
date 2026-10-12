{ ... }:
{
  # Ce fichier décrits les packets qui n'ont pas besoin de configurations particulières
  # Paquet pouvant être importé par tout le monde
  flake.homeModules.paquets-utilitaires =
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
        fzf
        bat
        jq
        gcc
        brightnessctl
        unzip

        # Shell
        wl-clipboard # permet de pipe pour copier, genre "cat file |wl-copy"
        glow # Pour afficher les fichiers md dans le terminal.

        # man pages :
        man-pages
        man-pages-posix

        # permet de créer des conteneurs d'autre distros; utile quand nixos casse les couilles
        distrobox

      ];
    };
  flake.homeModules.paquets-desktop =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        baobab # disk usage analyser dans le launcher
        kdePackages.okular

        simple-scan # Pour scanner
        # Suite bureautique :
        onlyoffice-desktopeditors

        # Communication
        vesktop # discord gui client

        # Mail
        thunderbird

        # Permet de download des video youtubes (utile pour un plugin)
        yt-dlp
      ];
    };
}
