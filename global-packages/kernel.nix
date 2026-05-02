{pkgs, ...}:
{
    boot.kernelPackages = pkgs.linuxPackages_latest; # Pour avoir la dernière version du kernel pour le channel actuel
}
