{
  lib,
  config,
  pkgs,
  ...
}: {
  options.bat.enable = lib.mkEnableOption "Bat";
  config = lib.mkIf config.bat.enable {
    home.packages = with pkgs; [
      bat
    ];
  };
}
