{ ... }:

{
  flake.nixosModules.laptop-lenovo-gpu =
    # GPUS.NIX : conf lié aux drivers gpu
    {
      pkgs,
      ...
    }:

    {
      # Paramètre nvidia :
      # Prime :
      hardware.nvidia.prime = {
        nvidiaBusId = "PCI:1@0:0:0";
        amdgpuBusId = "PCI:6@0:0:0"; # If you have an AMD iGPU
      };
      hardware.nvidia.modesetting.enable = true;

      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia.open = true; # see the note above
      hardware.enableRedistributableFirmware = true;
      hardware.graphics = {
        enable = true;
        enable32Bit = true;

        extraPackages = with pkgs; [
          mesa
          libva
          libva-utils
        ];
      };
      environment.systemPackages = with pkgs; [
        nvidia-vaapi-driver
      ];

      environment.sessionVariables = {
        NVD_BACKEND = "direct";
        LIBVA_DRIVER_NAME = "nvidia";
      };
    };
}
