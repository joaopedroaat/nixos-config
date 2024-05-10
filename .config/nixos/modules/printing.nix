{
  lib,
  config,
  ...
}: {
  options.printing.enable = lib.mkEnableOption "Printing";
  config = lib.mkIf config.printing.enable {
    services.printing.enable = true;

    # Enable autodiscovery of network printers
    services.avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };
  };
}
