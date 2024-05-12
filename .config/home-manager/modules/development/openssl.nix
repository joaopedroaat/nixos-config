{
  lib,
  config,
  pkgs,
  ...
}: {
  options.openssl.enable = lib.mkEnableOption "Openssl";
  config = lib.mkIf config.openssl.enable {
    home.packages = with pkgs; [
      openssl
    ];
  };
}
