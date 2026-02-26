{ pkgs, ...}:

{
# BOOTLOADER :
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.limine = {
      enable = true;
      secureBoot.enable = true;
      extraEntries = ''
        /Windows
            protocol: efi
            path: uuid(5053d353-6716-4aab-a7e9-6382b55b6981):/EFI/Microsoft/Boot/bootmgfw.efi
      '';
  };
}


