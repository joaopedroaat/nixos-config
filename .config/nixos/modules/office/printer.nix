{
  lib,
  config,
  ...
}: {
  options.printer.enable = lib.mkEnableOption "Printer";
  config = lib.mkIf config.printer.enable {
    services.printing.enable = true;

    # Enable autodiscovery of network printers
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
