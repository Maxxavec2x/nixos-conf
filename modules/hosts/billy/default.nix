{ self, inputs, ... }:
{
  flake.nixosConfigurations.billy = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.billy-configuration
    ];
  };
}
