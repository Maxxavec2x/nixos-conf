{ pkgs, ...}:

{
networking.hostName = "laptop-nixos1"; # Define your hostname.

# Configure network connections interactively with nmcli or nmtui.
networking.networkmanager.enable = true;
networking.networkmanager.dns = "systemd-resolved";
networking.extraHosts = 
  ''
    10.51.0.1 hotspot.va-solutions.fr
  '';

}
