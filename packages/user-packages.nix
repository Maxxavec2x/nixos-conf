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

     ];
}
