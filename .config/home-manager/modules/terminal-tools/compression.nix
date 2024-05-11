{
  lib,
  config,
  pkgs,
  ...
}: {
  options.compression.enable = lib.mkEnableOption "Compression";
  config = lib.mkIf config.compression.enable {
    home.packages = with pkgs; [
      zip
      unzip
      gnutar
    ];
  };
}
