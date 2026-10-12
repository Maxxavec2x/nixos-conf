# Contains the CAPEv2 malware sandbox services (core, processor, rooter, web)
{ inputs, ... }:
{
  flake.nixosModules.capev2 =
    { lib, ... }:

    let
      vms = {
        cuckoo1 = "192.168.100.191";
        cuckoo2 = "192.168.100.242";
        cuckoo3 = "192.168.100.153";
      };
    in
    {

      imports = [ inputs.capev2.nixosModules.capev2 ];
      # Important sinon l'analyse ne fait rien
      networking.firewall.interfaces.virbr1.allowedTCPPorts = [ 2042 ];
      services.capev2 = {
        enable = true;

        settings = {
          cuckoo = {
            cuckoo.machinery = "kvm";
            resultserver = {
              ip = "192.168.100.1";
              port = 2042;
            };
          };

          kvm = {
            kvm = {
              machines = lib.concatStringsSep "," (lib.attrNames vms);
              interface = "virbr1";
              dsn = "qemu:///system";
            };
          }
          // lib.mapAttrs (name: ip: {
            label = name;
            platform = "windows";
            inherit ip;
            arch = "x64";
            #tag = "x86, x64";
            #          snapshot = "clean";
          }) vms;
        };
      };
    };
}
