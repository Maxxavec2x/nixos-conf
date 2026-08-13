{
  flake.homeModules.nautilus =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        nautilus
        gvfs
      ];
    };
}
