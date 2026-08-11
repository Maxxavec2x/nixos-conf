{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {

      # Installation des fonts :
      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        nerd-fonts.jetbrains-mono
      ];
    };
}
