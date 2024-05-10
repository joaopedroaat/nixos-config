{
  lib,
  config,
  pkgs,
  ...
}: {
  options.scanner.enable = lib.mkEnableOption "Scanner";
  config = lib.mkIf config.scanner.enable {
    hardware.sane = {
      enable = true;
      extraBackends = with pkgs; [
        # Driverless Apple AirScan and Microsoft WSD
        sane-airscan
        # Epson
        epkowa
        utsushi
        # HP
        hplipWithPlugin
      ];
    };

    # Epson
    services.udev.packages = with pkgs; [utsushi];
  };
}
