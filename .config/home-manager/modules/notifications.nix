{
  lib,
  config,
  pkgs,
  ...
}: {
  options.notifications.enable = lib.mkEnableOption "Notifications";
  config = lib.mkIf config.notifications.enable {
    home.packages = with pkgs; [
      libnotify
      dunst
    ];
  };
}
