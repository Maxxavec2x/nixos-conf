{ self, ... }:
{
  flake.nixosModules.maxx-user =
    { pkgs, ... }:
    {
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
      home-manager.users.maxx = self.homeModules.maxx-home;
    };
}
