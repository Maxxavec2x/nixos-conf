{...}:
{
  programs.zsh = {
  enable = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;

  oh-my-zsh = {
    enable = false; # pas de OMZ → shell très rapide
  };

  initContent = ''
    alias icat="kitty +kitten icat"
    alias kssh="kitty +kitten ssh"
    alias vim="nvim"
    alias cat="bat"

    if env | grep -Fq 'DISTROBOX'; then
      PS1="$CONTAINER_ID-$(hostname)$ "
    else
      eval "$(starship init zsh)"
    fi

    zmodload zsh/complist                 
    zstyle ':completion:*' menu select=1 
    zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}

    # Prompt pour savoir où est le curseur
    zstyle ':completion:*' select-prompt '%SScrolling: current selection at %p%s'
  '';
};

}
