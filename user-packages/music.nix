# conf pour créer de la music 
#

{pkgs, ...}:
let # Pour les plugins, on est obligé de wrap le path 
  lv2Path = "${pkgs.x42-avldrums}/lib/lv2:${pkgs.x42-plugins}/lib/lv2";
in
{
  home.packages = with pkgs; [
    x42-avldrums
    x42-plugins
    (symlinkJoin {
      name = "ardour";
      paths = [ ardour ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/ardour8 \
          --set LV2_PATH "${lv2Path}"
      '';
    })
  ];
}
