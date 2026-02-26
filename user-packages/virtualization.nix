# Packages nécessaires pour la virtualisation
#

{config, pkgs, ... }:
{
  home.packages = with pkgs; [
    virt-manager
    virt-viewer
    spice 
    spice-gtk
    spice-protocol

    # Pour virtualisation windows
    #win-virtio
    #win-spice
  ];

  dconf.settings = {
  "org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
  };
};
}
