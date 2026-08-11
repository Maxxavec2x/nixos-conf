{
  flake.homeModules.dark_mode =
    { pkgs, ... }:
    {
      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark"; # Use "prefer-light" for light mode
        };
      };

      gtk = {
        enable = true;

        colorScheme = "dark";

        theme = {
          package = pkgs.gnome-themes-extra;
          name = "Adwaita-dark";
        };

        cursorTheme = {
          package = pkgs.adwaita-icon-theme;
          name = "Adwaita";
          size = 24;
        };
        gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
        gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
      };

      qt = {
        enable = true;
        style = {
          name = "adwaita-dark";
        };
      };
    };
}
