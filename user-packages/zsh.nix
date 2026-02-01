{...}:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
      "git"
      "direnv"
      ];
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
    '';
  };
}
