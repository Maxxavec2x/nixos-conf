# Contains the CAPEv2 malware sandbox services (core, processor, rooter, web)
{ inputs, ... }:
{
  flake.nixosModules.cape-sandbox = {
    imports = [ inputs.capev2.nixosModules.capev2 ];

    services.capev2 = {
      enable = true;
      settings = {
        cuckoo = {
          cuckoo.machinery = "kvm";
          resultserver = {
            ip = "192.168.122.1";
            port = 2042;
          };
        };

        kvm = {
          kvm = {
            machines = "cuckoo1";
            interface = "virbr0";
            dsn = "qemu:///system";
          };
          cuckoo1 = {
            label = "cuckooTest";
            platform = "windows";
            ip = "192.168.122.101";
            arch = "x64";
            snapshot = "clean";
          };
        };
      };
    };
  };
}
