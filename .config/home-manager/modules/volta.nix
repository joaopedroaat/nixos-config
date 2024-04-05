{
  lib,
  config,
  pkgs,
  ...
}: {
  options.volta.enable = lib.mkEnableOption "Volta";
  config = lib.mkIf config.volta.enable {
    home.packages = with pkgs; [
      volta
    ];
  };
}
