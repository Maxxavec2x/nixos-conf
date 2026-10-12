{ self, ... }:
{

  # Module home manager qui peut être include par tout les hosts
  flake.homeModules.maxx-home-base =
    { ... }:
    {
      imports = [

        self.homeModules.tmux
        self.homeModules.zoxide
        self.homeModules.zsh
        self.homeModules.fastfetch
        self.homeModules.nh

        self.homeModules.direnv
        self.homeModules.nixvim

        self.homeModules.btop

        self.homeModules.paquets-utilitaires
      ];
      programs.bash.enable = true;
      home.stateVersion = "26.11";
      home.username = "maxx";
      home.homeDirectory = "/home/maxx";
    };

  flake.homeModules.maxx-home-desktop =
    { ... }:
    {
      imports = [

        #self.homeModules.niri-homeModule
        self.homeModules.umbriel
        self.homeModules.noctalia-homeModule

        # Browser (web et file)
        #self.homeModules.firefox
        self.homeModules.librewolf
        self.homeModules.nautilus

        self.homeModules.paquets-desktop
        self.homeModules.kitty
        self.homeModules.gaming-apps

        self.homeModules.zeditor
        self.homeModules.helix
        self.homeModules.minecraft-modding

        self.homeModules.virtualization
        self.homeModules.dark_mode
        self.homeModules.mpv
      ];
      home.sessionVariables = {
        TERMINAL = "kitty";
        XCURSOR_THEME = "Adwaita";
        XCURSOR_SIZE = "24";
        XDG_SCREENSHOTS_DIR = "/home/maxx/Pictures/screenshots";
      };
    };

}
