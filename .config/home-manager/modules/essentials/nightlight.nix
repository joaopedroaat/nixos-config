{
  lib,
  config,
  ...
}: {
  options.nightlight.enable = lib.mkEnableOption "Nightlight";
  config = lib.mkIf config.nightlight.enable {
    services.wlsunset = {
      enable = true;
      latitude = "-9.665220";
      longitude = "-35.735710";
    };
  };
}
