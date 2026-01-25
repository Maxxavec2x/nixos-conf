{ pkgs, ... }:

{
services.greetd = {
  enable = true;
  settings = {
    default_session = {
      command = "start-hyprland -- -c /etc/greetd/hyprland.conf";
      user = "greeter";
    };
  };
};
# Permet de créer un fichier dans /etc/greetd/hyprland.conf
environment.etc."greetd/hyprland.conf".text = ''
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


  # voir https://github.com/rharish101/ReGreet/blob/main/regreet.sample.toml
  programs.regreet = {
      enable = true;
      settings = {
	GTK = {
	  # Whether to use the dark theme
	  application_prefer_dark_theme = true;
	  cursor_theme_name = "Adwaita";
	  cursor_blink = true;
	  # Icon theme name
	  icon_theme_name = "Adwaita";
	  # GTK theme name
	  theme_name = "Adwaita";
	};
	commands = {
	  # The command used to reboot the system
	  reboot = [ "systemctl" "reboot" ];

	  # The command used to shut down the system
	  poweroff = [ "systemctl" "poweroff" ];
	};
      };
  };

}
