{...}:
{
# direnv (permet de rentrer automatiquement dans un environment de dev en fonction du cwd)
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };
}
