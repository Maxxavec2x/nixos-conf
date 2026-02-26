# Déclaration des options:

{lib, ...}:
{
  options = {
    appareil.kittyFontSize = lib.mkOption {
    type = lib.types.int;
    default = 12;
    description = "Kitty font size depending on host";
    };
  };
}

