{ ... }:
{
  flake.nixosModules.laptop-lenovo-hardware =
    {
      config,
      lib,
      ...
    }:
    {
      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/20a3f93b-11d1-49f4-bb67-e2e3aade0085";
        fsType = "ext4";
      };

      fileSystems."/data" = {
        device = "/dev/disk/by-uuid/5f6fea83-b48a-4859-baa7-a7786bc3f13d";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/6CBD-84B4";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [
        { device = "/dev/disk/by-uuid/ae9061be-12df-4a51-885d-795769c46723"; }
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    };
}
