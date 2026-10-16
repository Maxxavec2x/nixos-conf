{ ... }:
{
  flake.nixosModules.sharky-hardware =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      boot.initrd.availableKernelModules = [
        "nvme"
        "ahci"
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];
      boot.kernelPackages = pkgs.linuxPackages_latest;

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/9c433bba-17a8-4229-83c1-d4abb12cda6a";
        fsType = "ext4";
      };

      fileSystems."/data" = {
        device = "/dev/disk/by-uuid/83d23e4c-33d0-4da7-99ec-40b176ea5e48";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/D16B-4721";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };

      swapDevices = [
        { device = "/dev/disk/by-uuid/ef4fef97-0b5d-4473-bc49-748c1fb6f85f"; }
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
