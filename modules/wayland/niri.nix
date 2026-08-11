{ self, inputs, ... }:
{
  flake.nixosModules.myNiri =
    { pkgs, ... }:
    {
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
      };
      programs.uwsm = {
        enable = true;
        waylandCompositors.niri = {
          prettyName = "Niri";
          comment = "Niri compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/niri";
          #extraArgs = [ "--session" ];
        };
      };
    };
  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        settings = {
          spawn-at-startup = [
            (lib.getExe self'.packages.myNoctalia)
            [
              "uwsm"
              "finalize"
            ]
          ];
          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

          input = {
            keyboard.xkb.layout = "fr";
            touchpad.tap = _: { };
            mouse.accel-profile = "flat";
          };
          cursor = {
            xcursor-theme = "Adwaita";
            xcursor-size = 24;
          };
          environment = {
            QT_QPA_PLATERFORM = "wayland";
          };

          layout.gaps = 5;
          prefer-no-csd = _: { };
          binds = {
            # Afficher tous les keybinds
            "Mod+Shift+Escape".show-hotkey-overlay = _: { };

            # Lancement d'applications
            "Mod+T".spawn-sh = lib.getExe pkgs.kitty;
            "Mod+F".spawn-sh = lib.getExe pkgs.firefox;
            "Mod+A".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
            "Mod+backspace".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call sessionMenu toggle";
            "Super+Alt+L".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call lockScreen lock";

            # Fenêtres
            "Mod+Q".close-window = _: { };
            "Mod+W".toggle-window-floating = _: { };
            "Alt+Return".fullscreen-window = _: { };

            # Focus (équivalent movefocus)
            "Mod+Left".focus-column-left = _: { };
            "Mod+H".focus-column-left = _: { };

            "Mod+Right".focus-column-right = _: { };
            "Mod+L".focus-column-right = _: { };

            "Mod+Up".focus-window-up = _: { };
            "Mod+K".focus-window-up = _: { };

            "Mod+Down".focus-window-down = _: { };
            "Mod+J".focus-window-down = _: { };

            # Layout :
            # Mettres les fenetre en colonne ou en ligne
            "Mod+comma".consume-window-into-column = _: { };
            "Mod+semicolon".expel-window-from-column = _: { };
            "Mod+Ctrl+F".expand-column-to-available-width = _: { };
            "Mod+C".center-column = _: { };
            "Mod+Ctrl+C".center-visible-columns = _: { };
            "Mod+dead_circumflex".consume-or-expel-window-left = _: { };
            "Mod+dollar".consume-or-expel-window-right = _: { };

            # Move columns :

            "Mod+Ctrl+Left".move-column-left = _: { };
            "Mod+Ctrl+H".move-column-left = _: { };

            "Mod+Ctrl+Right".move-column-right = _: { };
            "Mod+Ctrl+L".move-column-right = _: { };

            "Mod+Ctrl+Up".move-window-up = _: { };
            "Mod+Ctrl+K".move-window-up = _: { };

            "Mod+Ctrl+Down".move-window-down = _: { };
            "Mod+Ctrl+J".move-window-down = _: { };

            # Redimensionnement (équivalent resizeactive, en % plutôt qu'en px)
            "Mod+Shift+Right".set-column-width = "+10%";
            "Mod+Shift+Left".set-column-width = "-10%";
            "Mod+Shift+Up".set-window-height = "-10%";
            "Mod+Shift+Down".set-window-height = "+10%";

            "Mod+Shift+L".set-column-width = "+10%";
            "Mod+Shift+h".set-column-width = "-10%";
            "Mod+Shift+K".set-window-height = "-10%";
            "Mod+Shift+J".set-window-height = "+10%";

            # Workspace
            "Mod+ampersand".focus-workspace = 1;
            "Mod+eacute".focus-workspace = 2;
            "Mod+quotedbl".focus-workspace = 3;
            "Mod+apostrophe".focus-workspace = 4;
            "Mod+parenleft".focus-workspace = 5;
            "Mod+minus".focus-workspace = 6;
            "Mod+egrave".focus-workspace = 7;
            "Mod+underscore".focus-workspace = 8;
            "Mod+ccedilla".focus-workspace = 9;
            "Mod+agrave".focus-workspace = 10;

            "Mod+Shift+ampersand".move-column-to-workspace = 1;
            "Mod+Shift+eacute".move-column-to-workspace = 2;
            "Mod+Shift+quotedbl".move-column-to-workspace = 3;
            "Mod+Shift+apostrophe".move-column-to-workspace = 4;
            "Mod+Shift+parenleft".move-column-to-workspace = 5;
            "Mod+Shift+minus".move-column-to-workspace = 6;
            "Mod+Shift+egrave".move-column-to-workspace = 7;
            "Mod+Shift+underscore".move-column-to-workspace = 8;
            "Mod+Shift+ccedilla".move-column-to-workspace = 9;
            "Mod+Shift+agrave".move-column-to-workspace = 10;

            "Mod+Shift+S".screenshot = _: { };
            # Media control
            "XF86AudioRaiseVolume".spawn-sh =
              "${lib.getExe self'.packages.myNoctalia} ipc call volume increase";
            "XF86AudioLowerVolume".spawn-sh =
              "${lib.getExe self'.packages.myNoctalia} ipc call volume decrease";
            "XF86AudioMute".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call volume muteOutput";
            "XF86AudioMicMute".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call volume muteInput";

            "XF86AudioNext".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call media next";
            "XF86AudioPrev".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call media previous";
            "XF86AudioPlay".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call media toggle";
            "XF86AudioPause".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call media toggle";

            # ─── Brightness Controls ───
            "XF86MonBrightnessUp".spawn-sh =
              "${lib.getExe self'.packages.myNoctalia} ipc call brightness increase";
            "XF86MonBrightnessDown".spawn-sh =
              "${lib.getExe self'.packages.myNoctalia} ipc call brightness decrease";
            # Quitter niri
            "Alt+M".quit = _: { };
          };
        };
      };
    };
}
