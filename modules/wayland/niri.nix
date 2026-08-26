{ inputs, ... }:
{
  flake.nixosModules.myNiri =
    { pkgs, ... }:
    {
      imports = [ inputs.niri.nixosModules.niri ];
      programs.niri.package = pkgs.niri;
      programs.niri.enable = true;
      # programs.niri.package = pkgs.niri-unstable; # si tu veux la unstable

      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
        config.niri = {
          default = [
            "gnome"
            "gtk"
          ];
          "org.freedesktop.impl.portal.Access" = "gtk";
          "org.freedesktop.impl.portal.FileChooser" = "gtk";
          "org.freedesktop.impl.portal.Notification" = "gtk";
          "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        };
      };

      programs.uwsm = {
        enable = true;
        waylandCompositors.niri = {
          prettyName = "Niri";
          comment = "Niri compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/niri";
          extraArgs = [ "--session" ];
        };
      };
    };
}
