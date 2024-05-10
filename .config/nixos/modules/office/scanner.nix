{
  lib,
  config,
  ...
}: {
  options.scanner.enable = lib.mkEnableOption "Scanner";
  config = lib.mkIf config.scanner.enable {
    hardware.sane.enable = true; # enables support for SANE scanners
  };
}
