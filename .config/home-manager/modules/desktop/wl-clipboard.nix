{
  lib,
  config,
  pkgs,
  ...
}: {
  options.wl-clipboard.enable = lib.mkEnableOption "Wayland Clipboard";
  config = lib.mkIf config.wl-clipboard.enable {
    home.packages = with pkgs; [
      wl-clipboard
    ];
  };
}
