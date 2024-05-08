{
  lib,
  config,
  pkgs,
  ...
}: {
  options.calcure.enable = lib.mkEnableOption "Calcure";
  config = lib.mkIf config.calcure.enable {
    home.packages = with pkgs; [
      calcure
    ];
  };
}
