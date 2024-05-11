{
  pkgs,
  lib,
  config,
  ...
}: {
  options.gimp.enable = lib.mkEnableOption "Gimp";
  config = lib.mkIf config.gimp.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
