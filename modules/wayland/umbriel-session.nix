{ inputs, ... }:
{
  flake.nixosModules.umbriel-session =
    { pkgs, ... }:
    {
      services.displayManager.sessionPackages = [
        inputs.umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
      programs.uwsm = {
        enable = true;
        waylandCompositors.umbriel = {
          prettyName = "Umbriel";
          comment = "Umbriel compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/start-umbriel";
          extraArgs = [ "--session" ];
        };
      };
    };
}
