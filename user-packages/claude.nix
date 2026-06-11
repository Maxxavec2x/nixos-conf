# Pour installer claude:
#

{ pkgs, ... }:

let
  claudeDesktop =
    (builtins.getFlake "github:k3d3/claude-desktop-linux-flake")
    .packages.${pkgs.system}.claude-desktop-with-fhs;
in
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    claudeDesktop
  ];
}
