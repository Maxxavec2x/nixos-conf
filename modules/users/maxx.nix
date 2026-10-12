{ self, ... }:
{
  flake.nixosModules.maxx-user =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      options.maxx.profil = {
        desktop = lib.mkEnableOption "profil desktop (graphique)";
      };

      config = {
        users.users.maxx = {
          isNormalUser = true;
          extraGroups = [
            "cdrom"
            "disk"
            "wheel"
            "render"
            "video"
            "input"
            "seat"
            "libvirtd"
          ];
          shell = pkgs.zsh;
          ignoreShellProgramCheck = true;
        };

        home-manager.users.maxx.imports = [
          self.homeModules.maxx-home-base
        ]
        ++ lib.optional config.maxx.profil.desktop self.homeModules.maxx-home-desktop;

      };
    };
}
