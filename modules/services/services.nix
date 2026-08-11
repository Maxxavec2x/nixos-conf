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
      services.pipewire = {
        enable = true;
        pulse.enable = true;
      };
      services.upower.enable = true;

      # Enable touchpad support (enabled default in most desktopManager).
      services.libinput.enable = true;

      # Enable the OpenSSH daemon.
      services.openssh.enable = true;

      services.flatpak.enable = true;

    };
}
