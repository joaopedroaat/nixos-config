{
  pkgs,
  lib,
  config,
  ...
}: {
  options.rofi.enable = lib.mkEnableOption "Rofi";
  config = lib.mkIf config.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = ./theme.rasi;
    };
  };
}
