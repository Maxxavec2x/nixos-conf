{ ... }:
{
  flake.nixosModules.laptop-lenovo-networking =
    { ... }:

    {
      networking.hostName = "laptop-nixos1"; # Define your hostname.

      # Configure network connections interactively with nmcli or nmtui.
      networking.networkmanager = {
        enable = true;
        dns = "systemd-resolved";
      };
      # tailscale
      services.tailscale.enable = true;
      services.mullvad-vpn = {
        enable = true;
        gui.enable = true;
      };
      services.resolved = {
        enable = true;
        settings = {
          Resolve = {
            DNSSEC = "allow-downgrade";
            DNSOverTLS = "false";
            FallbackDNS = [
              "1.1.1.1"
              "1.0.0.1"
            ];
          };
        };
      };
      # Permet d'utiliser mullvad et tailscale en même temps, en excluant les flux taislacle de mullvad:
      networking.firewall.extraCommands = ''
        iptables -t mangle -A OUTPUT -d 100.64.0.0/10 -j CONNMARK --set-xmark 0x00000f41/0xffffffff
        iptables -t mangle -A OUTPUT -d 100.64.0.0/10 -j MARK --set-xmark 0x6d6f6c65/0xffffffff
      '';

      networking.firewall.extraStopCommands = ''
        iptables -t mangle -D OUTPUT -d 100.64.0.0/10 -j CONNMARK --set-xmark 0x00000f41/0xffffffff || true
        iptables -t mangle -D OUTPUT -d 100.64.0.0/10 -j MARK --set-xmark 0x6d6f6c65/0xffffffff || true
      '';
    };
}
