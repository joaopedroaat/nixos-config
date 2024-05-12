{
  lib,
  config,
  pkgs,
  ...
}: {
  options.netcat.enable = lib.mkEnableOption "Netcat";
  config = lib.mkIf config.netcat.enable {
    home.packages = with pkgs; [
      netcat-gnu
    ];
  };
}
