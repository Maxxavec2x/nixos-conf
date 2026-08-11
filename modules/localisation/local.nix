# FIchier de conf pour layout clavier et timezone
{ ... }:

{
  flake.nixosModules.localisation =
    { ... }:
    {
      # Set your time zone.
      time.timeZone = "Europe/London";

      # Select internationalisation properties.
      i18n.defaultLocale = "fr_FR.UTF-8";
      console = {
        font = "Lat2-Terminus16";
        keyMap = "fr";
        useXkbConfig = false; # use xkb.options in tty.
      };
      services.xserver = {
        xkb.layout = "fr";
        xkb.variant = "azerty";
      };
    };
}
