{ self, ... }:
{

  flake.homeModules.maxx-home =
    { ... }:
    {
      imports = [
        self.homeModules.firefox
        self.homeModules.paquets
        self.homeModules.tmux
        self.homeModules.zoxide
        self.homeModules.zsh
        self.homeModules.kitty
        self.homeModules.gaming-apps
        self.homeModules.direnv
        self.homeModules.zeditor
        self.homeModules.virtualization
        self.homeModules.dark_mode
      ];
      programs.bash.enable = true;
      home.stateVersion = "26.11";
      home.username = "maxx";
      home.homeDirectory = "/home/maxx";
      home.sessionVariables = {
        TERMINAL = "kitty";
        XCURSOR_THEME = "Adwaita";
        XCURSOR_SIZE = "24";
        XDG_SCREENSHOTS_DIR = "/home/maxx/Pictures/screenshots";
      };
    };

}
