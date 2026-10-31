# Patch la faille emudhra pour les ca-certificate.
# voir : https://emudhra.we-have-a-problem.com/

{ ... }:
{

  flake.nixosModules.ca-security = { ... }: {
    security.pki.caCertificateBlacklist = [
      "Comodo AAA Services root"
      "emSign ECC Root CA - G3"
    ];
  };
}
