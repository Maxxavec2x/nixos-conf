#via https://wiki.nixos.org/wiki/Distrobox
{pkgs, ...}:

{

home.packages = with pkgs; [
  distrobox

  docker-compose
];

}
