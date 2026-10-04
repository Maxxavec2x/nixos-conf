{ inputs, ... }:
{
  flake.nixosModules.umbriel-session =
    { pkgs, ... }:
    {
      #nixpkgs.overlays = [ inputs.umbriel.overlays.default ];

      services.displayManager.sessionPackages = [
        inputs.umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      #programs.uwsm = {
      #  enable = true;
      #  waylandCompositors.umbriel = {
      #    prettyName = "Umbriel";
      #    comment = "Umbriel compositor managed by UWSM";
      #    binPath = "/run/current-system/sw/bin/start-umbriel";
      #    extraArgs = [ "--session" ];
      #  };
      #};

      services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
      };
      services.gnome.gnome-keyring.enable = true;

      xdg.portal = {
        enable = true;
        extraPortals = [
          pkgs.xdg-desktop-portal-umbriel
          pkgs.xdg-desktop-portal-gtk
        ];
        config.umbriel = {
          default = [ "gtk" ];
          "org.freedesktop.impl.portal.ScreenCast" = "umbriel";
          "org.freedesktop.impl.portal.Screenshot" = "umbriel";
          "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        };
      };
    };
}
