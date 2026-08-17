# Conf fastfetch
{ inputs, ... }:
{
  flake.homeModules.fastfetch =
    { pkgs, ... }:
    {
      programs.fastfetch = {
        enable = true;
        settings = {
          logo = {
            source = "${./NixOS.png}";
            width = 30;
          };
          display = {
            separator = " ";
          };
          modules = [
            "title"
            "separator"
            {
              type = "kernel";
              key = "Kernel";
            }
            {
              type = "uptime";
              key = "Uptime";
            }
            {
              type = "shell";
              key = "Shell";
            }
            {
              type = "terminal";
              key = "Terminal";
            }
            {
              type = "cpu";
              key = "CPU";
            }
            {
              type = "memory";
              key = "RAM";
            }
            {
              type = "disk";
              key = "Disk";
            }
            {
              type = "wm";
              key = "WM";
            }
            {
              type = "localip";
              key = "Local IP";
            }
          ];
        };
      };
    };
}
