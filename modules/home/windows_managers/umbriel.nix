# Conf umbriel
{ inputs, ... }:
{
  flake.homeModules.umbriel =
    {
      lib,
      pkgs,
      ...
    }:
    let
      noctalia = "noctalia";
      msg = cmd: "spawn:${noctalia} msg ${cmd}";
      wsKeys = [
        "ampersand"
        "eacute"
        "quotedbl"
        "apostrophe"
        "parenleft"
        "minus"
        "egrave"
        "underscore"
        "ccedilla"
        "agrave"
      ];

      workspaceBinds = lib.listToAttrs (
        lib.concatLists (
          lib.imap1 (i: key: [
            {
              name = "Mod+${key}";
              value = "workspace-switch:${toString i}";
            }
            {
              name = "Mod+Shift+${key}";
              value = "column-move-to-workspace:${toString i}";
            }
          ]) wsKeys
        )
      );
    in
    {
      imports = [ inputs.umbriel.homeModules.default ];

      programs.umbriel = {
        enable = true;
        settings = {
          general = {
            autostart = [
              "uwsm finalize"
              noctalia
            ];
            show_cheatsheet = false;
            xwayland = true;
          };

          environment = {
            QT_QPA_PLATFORM = "wayland";
            ELECTRON_OZONE_PLATFORM_HINT = "auto";
          };

          layout.gap = 5;

          input = {
            keyboard = {
              layout = "fr";
              numlock_toggle = true;
            };
            touchpad = {
              tap = true;
              accel_profile = "flat";
              natural_scroll = false;
            };
            mouse.accel_profile = "flat";
            cursor = {
              theme = "Adwaita";
              size = 24;
            };
          };

          window_rule = [
            {
              match.app_id = "^kitty$";
              default_scrolling_extent = 0.5;
            }
          ];

          keybinds = {
            "Mod+Shift+Escape" = "cheatsheet-toggle";
            # Échappatoire si une appli (jeu, bureau distant) inhibe les raccourcis
            "Mod+Ctrl+Escape" = {
              action = "shortcuts-inhibit-toggle";
              allow_when_inhibited = true;
              repeat = false;
            };

            # Lancement d'applications
            "Mod+T" = "spawn:kitty";
            "Mod+E" = "spawn:nautilus";
            "Mod+F" = "spawn:librewolf";
            "Mod+A" = msg "panel-toggle launcher";
            "Mod+BackSpace" = msg "panel-open session";
            "Mod+End" = msg "session shutdown";
            "Super+Alt+L" = msg "session lock";

            # Fenêtres
            "Mod+Q" = "window-close";
            "Mod+W" = "window-toggle-floating";
            "Alt+Return" = "window-toggle-fullscreen";

            # Focus
            "Mod+Left" = "window-focus-left";
            "Mod+H" = "window-focus-left";
            "Mod+Right" = "window-focus-right";
            "Mod+L" = "window-focus-right";
            "Mod+Up" = "window-focus-up";
            "Mod+K" = "window-focus-up";
            "Mod+Down" = "window-focus-down";
            "Mod+J" = "window-focus-down";

            # Layout
            "Mod+comma" = "window-consume-right";
            "Mod+semicolon" = "window-consume-or-expel-right";
            "Mod+Ctrl+F" = "window-toggle-maximize";
            "Mod+C" = "column-center";
            "Mod+dead_circumflex" = "window-consume-or-expel-left";
            "Mod+dollar" = "window-consume-or-expel-right";
            "Mod+R" = "window-cycle-primary-extent";

            # Déplacement vers un autre écran
            "Mod+Shift+Ctrl+Left" = "column-move-to-output-left";
            "Mod+Shift+Ctrl+H" = "column-move-to-output-left";
            "Mod+Shift+Ctrl+Right" = "column-move-to-output-right";
            "Mod+Shift+Ctrl+L" = "column-move-to-output-right";
            "Mod+Shift+Ctrl+Up" = "window-move-to-output-up";
            "Mod+Shift+Ctrl+K" = "window-move-to-output-up";
            "Mod+Shift+Ctrl+Down" = "window-move-to-output-down";
            "Mod+Shift+Ctrl+J" = "window-move-to-output-down";

            # Déplacement de colonne / fenêtre
            "Mod+Ctrl+Left" = "column-move-left";
            "Mod+Ctrl+H" = "column-move-left";
            "Mod+Ctrl+Right" = "column-move-right";
            "Mod+Ctrl+L" = "column-move-right";
            "Mod+Ctrl+Up" = "window-move-up";
            "Mod+Ctrl+K" = "window-move-up";
            "Mod+Ctrl+Down" = "window-move-down";
            "Mod+Ctrl+J" = "window-move-down";

            # Redimensionnement
            "Mod+Shift+Right" = "window-modify-primary-extent:0.1";
            "Mod+Shift+Left" = "window-modify-primary-extent:-0.1";
            "Mod+Shift+Up" = "window-modify-secondary-extent:-0.1";
            "Mod+Shift+Down" = "window-modify-secondary-extent:0.1";
            "Mod+Shift+L" = "window-modify-primary-extent:0.1";
            "Mod+Shift+H" = "window-modify-primary-extent:-0.1";
            "Mod+Shift+K" = "window-modify-secondary-extent:-0.1";
            "Mod+Shift+J" = "window-modify-secondary-extent:0.1";

            # Capture d'écran (gérée par Noctalia)
            "Mod+Shift+S" = msg "screenshot-region";

            # Médias
            "XF86AudioRaiseVolume" = msg "volume-up";
            "XF86AudioLowerVolume" = msg "volume-down";
            "XF86AudioMute" = msg "volume-mute";
            "XF86AudioMicMute" = msg "mic-mute";
            "XF86AudioNext" = msg "media next";
            "XF86AudioPrev" = msg "media previous";
            "XF86AudioPlay" = msg "media toggle";
            "XF86AudioPause" = msg "media toggle";
            "XF86MonBrightnessUp" = msg "brightness-up";
            "XF86MonBrightnessDown" = msg "brightness-down";

            "Alt+M" = "session-quit";
          }
          // workspaceBinds;
        };
      };
    };
}
