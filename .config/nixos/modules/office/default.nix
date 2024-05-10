{
  lib,
  config,
  ...
}: {
  imports = [./printer.nix ./scanner.nix];
  options.office.enable = lib.mkEnableOption "Office";
  config = lib.mkIf config.office.enable {
    printer.enable = true;
    scanner.enable = true;
  };
}
