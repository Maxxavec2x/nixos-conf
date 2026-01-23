{pkgs, ...}:

{
     # Les différents packages accessible à mon user
     users.users.maxx.packages = with pkgs; [
       tree
       starship
       oh-my-zsh
       waypaper
       hyprpaper
       hyprlock
       wlogout
       fastfetch
       fzf
       btop
       gcc 
     ];
}
