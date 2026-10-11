{ ... }:

{
  flake.nixosModules.sharky-gpu =
    # GPUS.NIX : conf lié aux drivers gpu
    { pkgs, ... }:

    {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
      hardware.enableAllFirmware = true;
    };

}
