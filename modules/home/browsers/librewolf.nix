# Conf librewolf
{
  flake.homeModules.librewolf =
    { ... }:
    {
      programs.librewolf = {
        enable = true;

        settings = {
          "privacy.resistFingerprinting" = false;
          "webgl.disabled" = false;
        };

        policies = {
          Cookies.Allow = [ "https://claude.ai" ];

          SearchEngines = {
            Default = "Startpage";
            Add = [
              {
                Name = "Startpage";
                URLTemplate = "https://www.startpage.com/do/search?q={searchTerms}";
                Method = "GET";
              }
            ];
          };
        };

        profiles.default = {
          isDefault = true;
          search = {
            force = true;
            default = "Startpage";
          };
        };
      };
    };
}
