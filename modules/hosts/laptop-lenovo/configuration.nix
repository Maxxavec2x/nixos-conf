{ self, ... }:
{
  flake.nixosModules.laptop-lenovo-configuration =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.laptop-lenovo-hardware
        self.nixosModules.laptop-lenovo-bootloader
        self.nixosModules.laptop-lenovo-gpu
        self.nixosModules.laptop-lenovo-networking

        self.nixosModules.myNiri
        self.nixosModules.noctalia-greeter
        self.nixosModules.maxx-user
        self.nixosModules.localisation
        self.nixosModules.bluetooth
        self.nixosModules.services
        self.nixosModules.steam
        self.nixosModules.virtualization
        self.nixosModules.containers
        self.nixosModules.fonts

        # Pour jouer a bigwalk avec microphone intégré
        self.nixosModules.audio_relay
        # Les modules home manager sont importé depuis user/maxx.nix
        self.nixosModules.myHomeManager
      ];

      # Settings propre à l'appareil
      home-manager.extraSpecialArgs = {
        kittyFontSize = 14;
        sentitivity = 0;
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
