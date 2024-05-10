{
  lib,
  config,
  ...
}: {
  imports = [./printer.nix ./scanner.nix];
  options.office.enable = lib.mkEnableOption "Office";
  config = lib.mkIf config.office.enable {
    printing.enable = true;
    scanning.enable = true;
  };
}
