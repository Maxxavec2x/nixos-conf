# Fichiers dans lequel il y a toute la conf lié au gaming
{pkgs, ...}: 

{
  home.packages = with pkgs; [
    appimage-run # pour démarrer les appimages
    protonup-qt
    bottles
    heroic
    lutris
  ];
  # Steam est installé system wide pour éviter problème de driver
}



