{
  lib,
  config,
  pkgs,
  ...
}: {
  options.tree.enable = lib.mkEnableOption "Tree";
  config = lib.mkIf config.tree.enable {
    home.packages = with pkgs; [
      tree
    ];
  };
}
