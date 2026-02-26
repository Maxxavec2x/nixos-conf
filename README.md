# CONF NIXOS MAXXAVEC2X


This is my environment for both my desktop and my laptop. I do not use flakes (for now).  
It uses nixpkgs (with nixpkgs unstable for hyprland), and Home-Manager.

## How to use

YOu can look the "set_conf.sh" script, it symlink the /etc/configuration.nix to the root of this git repo, and it copy the hardware-configuration file that you created into the repo.
You have to import a hardware-specific-configuration into hardware-configuration, for setting bootloader, gpu drivers, networking, ...

## Dev env 
For development, I use shell.nix with direnv. I made snippets (available in ./config/nvim/snippets/) that bootstrap a simple dev environment for some languages.
