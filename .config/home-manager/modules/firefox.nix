{
  lib,
  config,
  pkgs,
  ...
}: {
  options.firefox.enable = lib.mkEnableOption "Firefox";
  config = lib.mkIf config.firefox.enable {
    home.packages = with pkgs; [
      firefox
    ];
  };
}
