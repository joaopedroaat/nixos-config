{
  lib,
  config,
  pkgs,
  ...
}: {
  options.bluetooth.enable = lib.mkEnableOption "Bluetooth";

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    environment.systemPackages = with pkgs; [
      bluetuith
    ];
  };
}
