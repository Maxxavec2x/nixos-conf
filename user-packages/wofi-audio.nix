# Stolen from https://www.reddit.com/r/NixOS/comments/1n0ps0c/how_to_change_audio_source_like_on_macos_for/
# and modified by myself
#
# USAGE :
# wofi-audio input/output : display inputs or sink in a list, you can click on an element to make it default

{ pkgs, ... }:
let
  wofi-audio = pkgs.writeShellScriptBin "wofi-audio" ''
#!/usr/bin/env bash

    set -e
    wofi_cmd=(wofi --show dmenu --prompt --hide-scroll --allow-markup --define=hide_search=true --location=top_right --width=600 --height=200 --xoffset=-60)

    mode="$1"

    menu() {
      case "$mode" in
      "output") printf " Output\n" ;;
      "input") printf " Input\n" ;;
      *) printf " Output\n Input\nMute output\nMute input\n" | "''${wofi_cmd[@]}" "Audio" ;;
      esac
    }

    pick() { # $1 = "Sinks" or "Sources"
      wpctl status | awk -v want="$1" '
              function strip_vol(s) { sub(/[[:space:]]*\[.*/, "", s); return s }

              /^Audio$/                { audio=1; next }
              /^(Video|Settings)$/     { audio=0; inner=0; next }

              audio && $0 ~ /[[:space:]]Sinks:*$/   { inner=(want=="Sinks");  next }
              audio && $0 ~ /[[:space:]]Sources:*$/ { inner=(want=="Sources"); next }

              inner && ($0 ~ /[[:space:]]Filters:$/  || \
                    $0 ~ /[[:space:]]Streams:$/  || \
                    $0 ~ /^[[:space:]]*$/)                   { inner=0; next }

              inner && match($0, /^[^0-9]*([0-9]+)\.\s*(\*?)\s*(.*)$/, m) {
                id=m[1]; star=(m[2]=="*" ? "★ " : ""); name=strip_vol(m[3])
                printf "%s\t%s%s\n", id, star, name
              }
            ' | "''${wofi_cmd[@]}" "$1" | cut -f1
    }

    if ! command -v wpctl >/dev/null 2>&1; then
      notify-send "wofi-audio" "wpctl not found. Install PipeWire/WirePlumber or adapt for pactl." || true
      exit 1
    fi

    case "$(menu)" in
    " Output")
      id=$(pick "Sinks")
      [[ -n "$id" ]] && wpctl set-default "$id"
      ;;
    " Input")
      id=$(pick "Sources")
      [[ -n "$id" ]] && wpctl set-default "$id"
      ;;
    "Mute output") wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    "Mute input") wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle ;;
    *) exit 0 ;;
    esac
  '';
in
{
  home.packages = with pkgs; [
    wofi-audio
    wofi
  ];
}
