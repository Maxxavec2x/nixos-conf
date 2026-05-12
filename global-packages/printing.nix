# Fichier qui permet de setup tout les services d'impression
# Voir : https://wiki.nixos.org/wiki/Printing

{pkgs, ...}:


{
  services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};

services.printing = {
  enable = true;
  drivers = with pkgs; [
    cups-filters
    cups-browsed
  ];
};

services.ipp-usb.enable = true;

}

