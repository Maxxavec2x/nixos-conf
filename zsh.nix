{ config, pkgs, ... }:

{
programs = {
    zsh = {
      enable = true;
      enableCompletion = false;
      enableGlobalCompInit = false;
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
