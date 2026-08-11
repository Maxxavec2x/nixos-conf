{ self, inputs, ... }:
{
  flake.nixosConfigurations.laptop-lenovo = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.laptop-lenovo-configuration
    ];
  };
}
