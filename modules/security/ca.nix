# Patch la faille emudhra pour les ca-certificate.
# voir : https://emudhra.we-have-a-problem.com/
# not useful anymore as it is in the nss-cert upstream

{ ... }:
{

  flake.nixosModules.ca-security = { ... }: {
    #security.pki.caCertificateBlacklist = [
    #  "Comodo AAA Services root"
    #  "emSign ECC Root CA - G3"
    #];
  };
}
