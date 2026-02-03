{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    initExtra = ''
      # -----------------------------
      # Powerlevel10k
      # -----------------------------
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

      bindkey -e

      # -----------------------------
      # Pour pas delete le full path quand on fait ctrl + backspace
      # -----------------------------
      WORDCHARS=''${WORDCHARS//\/}

      # -----------------------------
      # Ctrl+Backspace
      # -----------------------------
      bindkey '^H' backward-kill-word
      bindkey '^[[3;5~' backward-kill-word

      # -----------------------------
      # Ctrl+← / Ctrl+→
      # -----------------------------
      bindkey '^[[1;5D' backward-word
      bindkey '^[[1;5C' forward-word
      bindkey '^[[5D' backward-word
      bindkey '^[[5C' forward-word

      # -----------------------------
      # Completion menu
      # -----------------------------
      autoload -Uz compinit
      compinit

      zmodload zsh/complist
      zstyle ':completion:*' menu select=1
      zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' select-prompt '%SScrolling: current selection at %p%s'

      # -----------------------------
      # Aliases
      # -----------------------------
      alias icat="kitty +kitten icat"
      alias kssh="kitty +kitten ssh"
      alias vim="nvim"
      alias cat="bat"

      # -----------------------------
      # Edit command line in editor
      # -----------------------------
      autoload -z edit-command-line
      zle -N edit-command-line
      bindkey "^X^E" edit-command-line
    '';
  };
}
