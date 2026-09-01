# Conf
{ ... }:
{
  flake.homeModules.niri-homeModule =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      actions = config.lib.niri.actions;
      noctalia = "noctalia";
    in
    {
      programs.niri.settings = {
        prefer-no-csd = true;

        spawn-at-startup = [
          {
            command = [
              "uwsm"
              "finalize"
            ];
          }
          { command = [ noctalia ]; }
        ];

        screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
        hotkey-overlay.skip-at-startup = true;

        # niri-flake gère en général xwayland-satellite tout seul ;
        # ne garde cette ligne que si le build te dit que la clé n'existe pas ailleurs.
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input = {
          keyboard = {
            xkb.layout = "fr";
            numlock = true;
          };
          touchpad = {
            tap = true;
            accel-profile = "flat";
            natural-scroll = false;
          };
          mouse.accel-profile = "flat";
        };

        cursor = {
          theme = "Adwaita";
          size = 24;
        };

        environment.QT_QPA_PLATFORM = "wayland";

        layout.gaps = 5;

        binds = with actions; {
          "Mod+Shift+Escape".action = show-hotkey-overlay;

          # Lancement d'applications
          "Mod+T".action = spawn (lib.getExe pkgs.kitty);
          "Mod+E".action = spawn (lib.getExe pkgs.nautilus);
          "Mod+F".action = spawn (lib.getExe pkgs.librewolf);
          "Mod+A".action = spawn-sh "${noctalia} msg panel-open launcher";
          "Mod+backspace".action = spawn-sh "${noctalia} msg panel-open session";
          "Mod+End".action = spawn-sh "${noctalia} msg session shutdown";
          "Super+Alt+L".action = spawn-sh "${noctalia} msg session lock";

          # Fenêtres
          "Mod+Q".action = close-window;
          "Mod+W".action = toggle-window-floating;
          "Alt+Return".action = fullscreen-window;

          # Focus
          "Mod+Left".action = focus-column-left;
          "Mod+H".action = focus-column-left;
          "Mod+Right".action = focus-column-right;
          "Mod+L".action = focus-column-right;
          "Mod+Up".action = focus-window-up;
          "Mod+K".action = focus-window-up;
          "Mod+Down".action = focus-window-down;
          "Mod+J".action = focus-window-down;

          # Layout
          "Mod+comma".action = consume-window-into-column;
          "Mod+semicolon".action = expel-window-from-column;
          "Mod+Ctrl+F".action = expand-column-to-available-width;
          "Mod+C".action = center-column;
          "Mod+Ctrl+C".action = center-visible-columns;
          "Mod+dead_circumflex".action = consume-or-expel-window-left;
          "Mod+dollar".action = consume-or-expel-window-right;
          "Mod+R".action = switch-preset-column-width;

          # Déplacement de colonnes
          "Mod+Ctrl+Left".action = move-column-left;
          "Mod+Ctrl+H".action = move-column-left;
          "Mod+Ctrl+Right".action = move-column-right;
          "Mod+Ctrl+L".action = move-column-right;
          "Mod+Ctrl+Up".action = move-window-up;
          "Mod+Ctrl+K".action = move-window-up;
          "Mod+Ctrl+Down".action = move-window-down;
          "Mod+Ctrl+J".action = move-window-down;

          # Redimensionnement
          "Mod+Shift+Right".action = set-column-width "+10%";
          "Mod+Shift+Left".action = set-column-width "-10%";
          "Mod+Shift+Up".action = set-window-height "-10%";
          "Mod+Shift+Down".action = set-window-height "+10%";
          "Mod+Shift+L".action = set-column-width "+10%";
          "Mod+Shift+h".action = set-column-width "-10%";
          "Mod+Shift+K".action = set-window-height "-10%";
          "Mod+Shift+J".action = set-window-height "+10%";

          # Workspaces
          "Mod+ampersand".action = focus-workspace 1;
          "Mod+eacute".action = focus-workspace 2;
          "Mod+quotedbl".action = focus-workspace 3;
          "Mod+apostrophe".action = focus-workspace 4;
          "Mod+parenleft".action = focus-workspace 5;
          "Mod+minus".action = focus-workspace 6;
          "Mod+egrave".action = focus-workspace 7;
          "Mod+underscore".action = focus-workspace 8;
          "Mod+ccedilla".action = focus-workspace 9;
          "Mod+agrave".action = focus-workspace 10;

          "Mod+Shift+ampersand".action.move-column-to-workspace = 1;
          "Mod+Shift+eacute".action.move-column-to-workspace = 2;
          "Mod+Shift+quotedbl".action.move-column-to-workspace = 3;
          "Mod+Shift+apostrophe".action.move-column-to-workspace = 4;
          "Mod+Shift+parenleft".action.move-column-to-workspace = 5;
          "Mod+Shift+minus".action.move-column-to-workspace = 6;
          "Mod+Shift+egrave".action.move-column-to-workspace = 7;
          "Mod+Shift+underscore".action.move-column-to-workspace = 8;
          "Mod+Shift+ccedilla".action.move-column-to-workspace = 9;
          "Mod+Shift+agrave".action.move-column-to-workspace = 10;

          "Mod+Shift+S".action.screenshot = { };

          # Médias
          "XF86AudioRaiseVolume".action = spawn-sh "${noctalia} msg volume-up";
          "XF86AudioLowerVolume".action = spawn-sh "${noctalia} msg volume-down";
          "XF86AudioMute".action = spawn-sh "${noctalia} msg volume-mute";
          "XF86AudioMicMute".action = spawn-sh "${noctalia} msg mic-mute";
          "XF86AudioNext".action = spawn-sh "${noctalia} msg media next";
          "XF86AudioPrev".action = spawn-sh "${noctalia} msg media previous";
          "XF86AudioPlay".action = spawn-sh "${noctalia} msg media toggle";
          "XF86AudioPause".action = spawn-sh "${noctalia} msg media toggle";

          "XF86MonBrightnessUp".action = spawn-sh "${noctalia} msg brightness-up";
          "XF86MonBrightnessDown".action = spawn-sh "${noctalia} msg brightness-down";

          "Alt+M".action = quit;

        };

        ## CONF WINDOWS RULES :
        window-rules = [
          {
            matches = [
              {
                app-id = "^kitty$";
              }
            ];
            default-column-width = {
              proportion = 0.5;
            };
          }
        ];
      };
    };
}
