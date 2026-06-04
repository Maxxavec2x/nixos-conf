{ pkgs, config, lib, ... }:
{
  services.greetd = {
    enable = true;
    settings.default_session = if config.appareil.autoLogin
      then {
        command = "start-hyprland -- -c /home/maxx/.config/hypr/hyprland.conf";
        user    = "maxx";
      }
      else {
        command = "start-hyprland -- -c /etc/greetd/hyprland.conf";
        user    = "greeter";
      };
  };

environment.etc = lib.optionalAttrs (!config.appareil.autoLogin) {
  "greetd/hyprland.conf".text = ''
    exec-once = regreet; hyprctl dispatch exit
    env = GTK_USE_PORTAL,0
    env = GDK_DEBUG,no-portals
    misc {
      disable_hyprland_logo = true
      disable_splash_rendering = true
      disable_hyprland_guiutils_check = true
    }
    input {
      kb_layout = fr
      kb_variant = azerty
    }
  '';
};

  programs.regreet = lib.mkIf (!config.appareil.autoLogin) {
    enable = true;
    settings = {
      GTK = {
        application_prefer_dark_theme = true;
        cursor_theme_name = "Adwaita";
        cursor_blink      = true;
        icon_theme_name   = "Adwaita";
        theme_name        = "Adwaita";
      };
      commands = {
        reboot   = [ "systemctl" "reboot" ];
        poweroff = [ "systemctl" "poweroff" ];
      };
    };
  };
}
