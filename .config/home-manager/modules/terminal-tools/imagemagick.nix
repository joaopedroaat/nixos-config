{
  lib,
  config,
  pkgs,
  ...
}: {
  options.imagemagick.enable = lib.mkEnableOption "Imagemagick";
  config = lib.mkIf config.imagemagick.enable {
    home.packages = with pkgs; [
      imagemagick_light
    ];
  };
}
