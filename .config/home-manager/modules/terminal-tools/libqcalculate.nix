{
  lib,
  config,
  pkgs,
  ...
}: {
  options.libqcalculate.enable = lib.mkEnableOption "Libqcalculate";
  config = lib.mkIf config.libqcalculate.enable {
    home.packages = with pkgs; [
      libqalculate
    ];
  };
}
