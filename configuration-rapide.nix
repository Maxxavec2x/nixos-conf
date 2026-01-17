# Conf rapide pour installer une vm ou un système basic, avec grub et uefi
{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

# BOOTLOADER :
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev"; 
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.

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

  # Enable CUPS to print documents.
  services.printing.enable = true;

   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.maxx = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };

  programs.firefox.enable = true;
  
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
		 kitty
		 git
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

  # Pour installer des logiciel non libres
  nixpkgs.config.allowUnfree = true; 
}

