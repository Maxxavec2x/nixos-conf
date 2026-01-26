# Installation des packages et services système wide 
{ config, lib, pkgs, ... }:
{

    imports =
    [
      ./firefox.nix
      ./plymouth.nix
    ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Permet d'activer le service seatd dont à besoin maxx
  services.seatd.enable = true;
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     vim 
     wget
     kitty
     git

     # Curseur
     adwaita-icon-theme

     # pour le module de greet :
     regreet

  ];

  # Installation des fonts :
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Pour installer des logiciel non libres
  nixpkgs.config.allowUnfree = true; 

}
