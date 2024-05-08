{
  lib,
  config,
  pkgs,
  ...
}: {
  options.pulsemixer.enable = lib.mkEnableOption "Pulsemixer";
  config = lib.mkIf config.pulsemixer.enable {
    home.packages = with pkgs; [
      pulsemixer
    ];
  };
}
