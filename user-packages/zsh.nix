{pkgs,...}:
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
  initContent = ''
    # config powerlevel10k
    [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    alias icat="kitty +kitten icat"
    alias kssh="kitty +kitten ssh"
    alias vim="nvim"
    alias cat="bat"

    if env | grep -Fq 'DISTROBOX'; then
      PS1="$CONTAINER_ID-$(hostname)$ "
    fi

    zmodload zsh/complist                 
    zstyle ':completion:*' menu select=1 
    zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}

    # Prompt pour savoir où est le curseur
    zstyle ':completion:*' select-prompt '%SScrolling: current selection at %p%s'

    # -----------------------------
    # Keybindings Ctrl+← / Ctrl+→
    # -----------------------------
    bindkey '^[[1;5D' backward-word
    bindkey '^[[1;5C' forward-word
    bindkey '^[[5D' backward-word
    bindkey '^[[5C' forward-word

  '';
};

}
