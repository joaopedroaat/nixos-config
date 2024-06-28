{
  lib,
  config,
  pkgs,
  ...
}: {
  options.trash-cli.enable = lib.mkEnableOption "Trash CLI";
  config = lib.mkIf config.trash-cli.enable {
    home.packages = with pkgs; [
      trash-cli
    ];
  };
}
