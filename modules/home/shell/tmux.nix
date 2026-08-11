{
  flake.homeModules.tmux =
    { ... }:
    {
      programs.tmux = {
        enable = true;
        clock24 = true;
        prefix = "C-a";
        keyMode = "vi";
        terminal = "screen-256color";
        historyLimit = 10000;
        mouse = true;
        escapeTime = 0;
        extraConfig = ''
          bind-key -T copy-mode-vi 'v' send -X begin-selection
          bind-key -T copy-mode-vi 'y' send -X copy-selection
          bind-key -n M-c copy-mode
          # SPLITS :
          unbind %
          unbind '"'

          bind s split-window -v
          bind v split-window -h

          # Navigation
          bind -r h select-pane -L
          bind -r j select-pane -D
          bind -r k select-pane -U
          bind -r l select-pane -R

          # Redimensionnement
          bind -r H resize-pane -L 5
          bind -r J resize-pane -D 5
          bind -r K resize-pane -U 5
          bind -r L resize-pane -R 5
        '';
      };
    };
}
