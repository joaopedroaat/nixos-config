{
  lib,
  config,
  pkgs,
  ...
}: {
  options.discord.enable = lib.mkEnableOption "Discord";
  config = lib.mkIf config.discord.enable {
    home.packages = with pkgs; [
      discord
    ];
  };
}
