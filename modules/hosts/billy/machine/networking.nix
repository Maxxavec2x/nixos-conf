{ ... }:
{
  flake.nixosModules.billy-networking =
    { ... }:

    {
      networking.hostName = "billy"; # Define your hostname.
      services.tailscale.enable = true;
      # Configure network connections interactively with nmcli or nmtui.
      networking.networkmanager.enable = true;
    };
}
