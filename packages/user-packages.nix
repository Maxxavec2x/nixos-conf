{pkgs, ...}:

{
     # Les différents packages accessible à mon user
     users.users.maxx.packages = with pkgs; [
      # Utilitaires
       tree
       fastfetch
       fzf
       btop
       gcc 
       baobab # disk usage analyser dans le launcher
       grimblast # capture d'écran
       dunst # notification daemon

      # Shell
       starship
       oh-my-zsh

      # Wallpaper
       waypaper
       swww
      
      # Lockscreen/exit menus
       hyprlock
       wlogout
        
      # Home manager
       home-manager

      # App launcher
       hyprlauncher
      
      # Communication
       vesktop
     ];
}
