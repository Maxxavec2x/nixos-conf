{
  flake.nixosModules.audio_relay =
    { ... }:
    {

      # Pour le serveur (celui qui emet le micro)
      networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 59100 ];
        allowedUDPPorts = [
          59100
          59200
        ];
      };

      # Pour le listener
      #      services.pipewire.extraConfig.pipewire = {
      #        "10-null-sink" = {
      #          "context.objects" = [
      #            {
      #              factory = "adapter";
      #              args = {
      #                "factory.name" = "support.null-audio-sink";
      #                "node.name" = "audiorelay-virtual-mic-sink";
      #                "node.description" = "Virtual Mic Sink";
      #                "media.class" = "Audio/Sink";
      #                "audio.position" = "FL,FR";
      #              };
      #            }
      #          ];
      #        };
      #        "20-virtual-mic" = {
      #          "context.modules" = [
      #            {
      #              name = "libpipewire-module-loopback";
      #              args = {
      #                "capture.props" = {
      #                  "node.target" = "audiorelay-virtual-mic-sink";
      #                };
      #                "playback.props" = {
      #                  "node.name" = "audiorelay-virtual-mic";
      #                  "node.description" = "Virtual Mic";
      #                  "media.class" = "Audio/Source";
      #                  "audio.position" = "FL,FR";
      #                  "node.passive" = true;
      #                };
      #              };
      #            }
      #          ];
      #        };
      #      };

    };
}
