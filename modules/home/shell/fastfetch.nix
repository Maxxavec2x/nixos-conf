# Conf fastfetch
# POUR LA LISTE DES MODULES :
# https://github.com/fastfetch-cli/fastfetch-wiki/blob/master/Json-Schema.md#511-property-json-config--modules--modules-items--anyof--item-0
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
            "os"
            {
              type = "command";
              key = "OS Age";
              text = "birth_install=$(stat -c %W /); current=$(date +%s); days_difference=$(( (current - birth_install) / 86400 )); echo $days_difference days";
            }
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
              type = "gpu";
              key = "GPU";
              format = "{name}";
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
