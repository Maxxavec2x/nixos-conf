# Conf globale pour la virtualisation

{config, pkgs, ... }:

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
}
