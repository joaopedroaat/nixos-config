{
  lib,
  config,
  pkgs,
  ...
}: {
  options.make.enable = lib.mkEnableOption "Make";
  config = lib.mkIf config.make.enable {
    home.packages = with pkgs; [
      gnumake
    ];
  };
}
