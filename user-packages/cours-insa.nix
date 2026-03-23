# Conf nécessaires pour les cours de l'insa

{pkgs, ...}:

{
  home.packages = with pkgs; [
      vmware-workstation
  ];
}
