{ config, lib, pkgs, ... }:

{
  # Paramètre nvidia :
  # Prime :
  hardware.nvidia.prime = {
    nvidiaBusId = "PCI:1@0:0:0";
    amdgpuBusId = "PCI:6@0:0:0"; # If you have an AMD iGPU
  };
  hardware.nvidia.modesetting.enable = true;

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;  # see the note above
}
