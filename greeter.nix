{ pkgs, ... }:

{
services.getty.autologinUser = "maxx";

# Stolen from : https://discourse.nixos.org/t/autologin-hyprland/38159/16
# Dead simple TTY-based auto-login setup for Hyprland
  environment.loginShellInit = ''
    # Launch Hyprland on TTY1, return to TTY when exiting
    if [ "$(tty)" = "/dev/tty1" ]; then
      exec uwsm start hyprland-uwsm.desktop # Use `exec Hyprland` to auto-restart on exit/crash instead
    fi
  '';
}
