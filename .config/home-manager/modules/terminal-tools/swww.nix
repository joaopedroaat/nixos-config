{
  lib,
  config,
  pkgs,
  ...
}: {
  options.swww.enable = lib.mkEnableOption "SWWW";
  config = lib.mkIf config.swww.enable {
    home.packages = with pkgs; [
      swww
    ];
  };
}
