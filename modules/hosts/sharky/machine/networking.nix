{ ... }:
{
  flake.nixosModules.sharky-networking =
    { ... }:

    {
      networking.hostName = "sharky"; # Define your hostname.

      # conf pour bypass l'anticheat de gta
      networking.extraHosts = ''
        0.0.0.0 paradise-s1.battleye.com
        0.0.0.0 test-s1.battleye.com
        0.0.0.0 paradiseenhanced-s1.battleye.com
      '';
      # Configure network connections interactively with nmcli or nmtui.
      networking.networkmanager.enable = true;
    };
}
