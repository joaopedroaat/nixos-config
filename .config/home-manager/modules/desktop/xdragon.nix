{
  lib,
  config,
  pkgs,
  ...
}: {
  options.xdragon.enable = lib.mkEnableOption "XDragon";
  config = lib.mkIf config.xdragon.enable {
    home.packages = with pkgs; [
      xdragon
    ];
  };
}
