{
  pkgs,
  lib,
  options,
  config,
  ...
}: {
  options.lutris.enable = lib.mkEnableOption "Lutris";
  config = lib.mkIf config.lutris.enable {
    environment.systemPackages = with pkgs; [
      lutris
    ];
  };
}
