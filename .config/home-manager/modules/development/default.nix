{
  lib,
  config,
  ...
}: {
  imports = [
    ./golang.nix
    ./google-cloud.nix
    ./openssl.nix
    ./aws.nix
  ];

  options.development.enable = lib.mkEnableOption "Development";
  config = lib.mkIf config.development.enable {
    golang.enable = true;
    google-cloud.enable = true;
    openssl.enable = true;
    aws.enable = true;
  };
}
