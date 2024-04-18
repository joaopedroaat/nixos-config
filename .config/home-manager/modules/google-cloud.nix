{
  lib,
  config,
  pkgs,
  ...
}: {
  options.google-cloud.enable = lib.mkEnableOption "Google Cloud";
  config = lib.mkIf config.google-cloud.enable {
    home.packages = with pkgs; [
      google-cloud-sdk
    ];
  };
}
