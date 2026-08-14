{
  flake.homeModules.zsh =
    { pkgs, ... }:

    {
      home.file.".p10k.zsh".source = ./p10k.zsh;
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
          ls = "ls --color";
        };
        history.size = 10000;

        plugins = [
          {
            name = "powerlevel10k";
            src = pkgs.zsh-powerlevel10k;
            file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
          }
        ];

        initContent = ''
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

          zmodload zsh/complist
          zstyle ':completion:*' menu select=1
          zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}
          zstyle ':completion:*' select-prompt '%SScrolling: current selection at %p%s'

          # -----------------------------
          # Aliases
          # -----------------------------
          if ! (env | grep -Fq 'DISTROBOX'); then # Pour ne pas mettre les alias dans le distrobox
            alias icat="kitty +kitten icat"
            alias kssh="kitty +kitten ssh"
            alias vim=nvim
            alias cat="bat"
          fi

          # -----------------------------
          # Edit command line in editor
          # -----------------------------
          autoload -z edit-command-line
          zle -N edit-command-line
          bindkey "^X^E" edit-command-line

          # -----------------------------
          # Completion: case-insensitive
          # -----------------------------
          zstyle ':completion:*' matcher-list "" 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
        '';
      };
    };
}
