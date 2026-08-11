# Contient à la fois la conf système pour la virtualisation (nixosModule),
# et un homeModule pour la conf utilisateur
{
  flake.nixosModules.virtualization =

    { ... }:

    {
      programs.dconf.enable = true;

      users.users.gcis = {
        extraGroups = [ "libvirtd" ];
        isNormalUser = true;
      };

      virtualisation = {
        libvirtd = {
          enable = true;
          qemu = {
            swtpm.enable = true;
          };
        };
        spiceUSBRedirection.enable = true;
      };

      services.spice-vdagentd.enable = true;
    };
  flake.homeModules.virtualization =
    # Packages nécessaires pour la virtualisation
    #

    { pkgs, ... }:
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
          autoconnect = [ "qemu:///system" ];
          uris = [ "qemu:///system" ];
        };
      };
    };
}
