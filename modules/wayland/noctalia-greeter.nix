{ inputs, ... }:
{
  flake.nixosModules.noctalia-greeter =
    { pkgs, ... }:
    {
      imports = [
        inputs.noctalia-greeter.nixosModules.default
      ];

      programs.noctalia-greeter = {
        enable = true;

        # Optional configuration
        greeter-args = "";
        # Full declarative greeter.toml (overwritten on each activation).
        # See examples/greeter.toml for every key (appearance.palette, output, …).
        settings = {
          appearance = {
            theme_mode = "dark";
            scheme = "Synced";
            password_style = "random";
          };
          user = {
            default = "maxx";
          };
          cursor = {
            theme = "Adwaita";
            size = 24;
            path = "${pkgs.adwaita-icon-theme}/share/icons";
          };
          keyboard = {
            layout = "fr";
          };
        };
      };
    };
}
