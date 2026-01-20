ZSH_THEME="robbyrussell"

alias icat="kitty +kitten icat"
alias kssh="kitty +kitten ssh"
alias vim="nvim"

setxkbmap fr &>/dev/null

# Conf pour faire en sorte que le ps1 change dans distrobox
if (env | grep -Fq 'DISTROBOX'); then
  PS1="$CONTAINER_ID-$(hostname)$ "
else
  # Conf que je ne veux pas dans distrobox
  #. "$HOME/.cargo/env"
  eval "$(starship init zsh)"
fi
