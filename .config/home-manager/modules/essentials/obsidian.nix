{
  lib,
  config,
  pkgs,
  ...
}: {
  options.obsidian.enable = lib.mkEnableOption "Obsidian";
  config = lib.mkIf config.obsidian.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
