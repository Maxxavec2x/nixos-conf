{ self, ... }:
{
  flake.nixosModules.billy-configuration =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.billy-hardware
        self.nixosModules.billy-bootloader
        self.nixosModules.billy-gpu
        self.nixosModules.billy-networking

        self.nixosModules.maxx-user
        self.nixosModules.localisation
        self.nixosModules.bluetooth
        self.nixosModules.services
        self.nixosModules.virtualization
        self.nixosModules.containers
        self.nixosModules.fonts
        self.nixosModules.ca-security

        # Les modules home manager sont importé depuis user/maxx.nix
        self.nixosModules.myHomeManager
      ];

      # Settings propre à l'appareil
      home-manager.extraSpecialArgs = {
        kittyFontSize = 12;
        sentitivity = -0.5;
      };
      maxx.profil = {
        desktop = false;
      };

      environment.systemPackages = with pkgs; [
        vim
      ];
      programs.zsh.enable = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "26.11";
    };
}
