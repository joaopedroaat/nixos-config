{
  lib,
  config,
  pkgs,
  ...
}: {
  options.insomnia.enable = lib.mkEnableOption "Insomnia";
  config = lib.mkIf config.insomnia.enable {
    home.packages = with pkgs; [
      insomnia
    ];
  };
}
