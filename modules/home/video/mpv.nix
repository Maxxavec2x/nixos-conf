# video player : voir https://wiki.nixos.org/wiki/MPV
{
  flake.homeModules.mpv =
    { pkgs, ... }:
    {

      programs.mpv = {
        enable = true;

        package = pkgs.mpv.override {
          scripts = with pkgs.mpvScripts; [
            uosc
            sponsorblock
          ];
        };

        config = {
          profile = "high-quality";
          ytdl-format = "bestvideo+bestaudio";
          #cache-default = 4000000;
        };
      };
    };
}
