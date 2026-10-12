# Contains various services
{ ... }:
{

  flake.nixosModules.services =
    {
      ...
    }:
    {

      # Permet d'activer le service seatd dont à besoin maxx
      services.seatd.enable = true;
      # lib temps réelle requis par pipewire
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
        wireplumber.enable = true;
      };
      services.upower.enable = true;

      # Enable touchpad support (enabled default in most desktopManager).
      services.libinput.enable = true;

      # Enable the OpenSSH daemon.
      services.openssh.enable = true;

      ## TODO: Faire un fichier pour flatpak, un autre pour sshd, etc...

      # permet de désactiver le wait pour le online boot vu
      # qu'on l'utilise pas
      systemd.services.NetworkManager-wait-online.enable = false;

    };
}
