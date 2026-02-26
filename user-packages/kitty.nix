{ config, pkgs, lib, nixosConfig, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = nixosConfig.appareil.kittyFontSize;
    };
    
    themeFile = "Alabaster_Dark";

    settings = {
      # terminal
      background_opacity = "1.0";
      background_blur = 1;
      term = "xterm-kitty";
      enable_audio_bell = "no";

      # cursor
      cursor_shape = "block";
      cursor_blink_interval = 0;
      cursor_stop_blinking_after = 0;
      shell_integration = "no-cursor";

      # scrollback
      scrollback_lines = 5000;
      wheel_scroll_multiplier = "3.0";

      # mouse
      mouse_hide_wait = -1;

      # window
      remember_window_size = "no";
      initial_window_width = 1200;
      initial_window_height = 750;
      window_border_width = "1.5pt";
      enabled_layouts = "tall";
      window_padding_width = 0;
      window_margin_width = 2;
      hide_window_decorations = "no";

      # tab bar
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_bar_edge = "bottom";
      tab_bar_align = "left";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";

      # shell
      shell = "${pkgs.zsh}/bin/zsh";

      confirm_os_window_close = 0;

      # emoji fallback
      symbol_map = "U+1F000-U+1FFFF Noto Color Emoji";
    };

    keybindings = {
      "ctrl+shift+backspace" = "change_font_size all 0";

      # window
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+]" = "next_window";
      "ctrl+shift+[" = "previous_window";

      # layout
      "ctrl+shift+l" = "next_layout";
      "ctrl+alt+r" = "goto_layout tall";
      "ctrl+alt+s" = "goto_layout stack";

      # tabs
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
      "ctrl+shift+q" = "close_tab";
    };
  };
}
