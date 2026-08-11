{ inputs, ... }:
{

  flake.nixosModules.myHomeManager =
    { ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.default # import official home-manager NixOS module
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };

}
