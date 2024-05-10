{
  lib,
  config,
  ...
}: {
  imports = [./printer.nix ./scanner.nix ./libreoffice.nix];
  options.office.enable = lib.mkEnableOption "Office";
  config = lib.mkIf config.office.enable {
    printer.enable = true;
    scanner.enable = true;
    libreoffice.enable = true;
  };
}
