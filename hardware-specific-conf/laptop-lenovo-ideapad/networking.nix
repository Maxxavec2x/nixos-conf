{ pkgs, ...}:

{
networking.hostName = "laptop-nixos1"; # Define your hostname.

# Configure network connections interactively with nmcli or nmtui.
networking.networkmanager.enable = true;
}
