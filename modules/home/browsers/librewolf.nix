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
          Cookies.Allow = [
            "https://claude.ai"
            "https://youtube.com"
            "https://github.com"
          ];

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
          ExtensionSettings = {
            "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
              # Bitwarden
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
              installation_mode = "normal_installed";
              private_browsing = true;
            };
            "idcac-pub@guus.ninja" = {
              # I still don't care about cookies
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
              installation_mode = "normal_installed";
              private_browsing = true;
            };
          };
          AIControls = {
            Translations = {
              Value = "blocked";
            };
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
