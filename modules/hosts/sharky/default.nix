{ self, inputs, ... }:
{
  flake.nixosConfigurations.sharky = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.sharky-configuration
    ];
  };
}
