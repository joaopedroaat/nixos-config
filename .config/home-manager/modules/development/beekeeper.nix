{
  lib,
  config,
  pkgs,
  ...
}: {
  options.beekeeper.enable = lib.mkEnableOption "Beekeeper";
  config = lib.mkIf config.beekeeper.enable {
    home.packages = with pkgs; [
      beekeeper-studio
    ];
  };
}
