# Conf pour programmer des mods minecraft
# Pour installer notamment intellij (IDE JAVA)

{ inputs, ... }:
{
  flake.homeModules.minecraft-modding =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        jetbrains.idea
      ];
    };

  flake.nixosModules.minecraft-modding =
    { pkgs, ... }:
    {
      programs.nix-ld.enable = true;
      programs.nix-ld.libraries = with pkgs; [
        mesa
        libglvnd
        wayland
        wayland-protocols
        libxkbcommon
        libX11
        libXcursor
        libXi
        libXrandr
        libXext
        glfw
        libGL
        alsa-lib
      ];
    };
}
