# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz";
  };
  unstable = import <unstable> {
	config.allowUnfree = true;
  };
in
{
  imports =
    [
      ./hardware-configuration.nix
      ./global-packages/global-packages.nix
      ./hyprland.nix
      ./greeter.nix
      ./zsh.nix
      ./dark_mode.nix
      ./bluetooth.nix
      (import "${home-manager}/nixos")
    ];

  # BOOTLOADER :
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.limine = {
      enable = true;
      secureBoot.enable = true;
      extraEntries = ''
        /Windows
            protocol: efi
            path: uuid(5053d353-6716-4aab-a7e9-6382b55b6981):/EFI/Microsoft/Boot/bootmgfw.efi
      '';
  };

  networking.hostName = "pc-fix-nixos1"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "fr_FR.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "fr";
     useXkbConfig = false; # use xkb.options in tty.
   };
  services.xserver = {
    xkb.layout = "fr";
    xkb.variant = "azerty";
  };

   users.users.maxx = {
     isNormalUser = true;
     extraGroups = [ "wheel" "video" "input" "seat" ]; # Enable ‘sudo’ for the user.
     shell = pkgs.zsh;
   };

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?


  # Déclarer l'user pour home-manager
  home-manager.users.maxx = import ./home.nix;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

}

