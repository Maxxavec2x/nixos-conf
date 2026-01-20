# Ce script sert à set la conf nix pour utiliser celle du repo
SCRIPT_DIR=$(dirname $(realpath "$0"))
sudo rm /etc/nixos/configuration.nix
cd /etc/nixos
sudo ln -s $SCRIPT_DIR/configuration.nix .
cd -
sudo cp /etc/nixos/hardware-configuration.nix $SCRIPT_DIR

# Pour ajoter les packages unstable
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable

sudo nix-channel --update
