{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [./fzf.nix ./libqcalculate.nix ./calcure.nix ./pulsemixer.nix];
  options.terminal-tools.enable = lib.mkEnableOption "Terminal tools";
  config = lib.mkIf config.terminal-tools.enable {
    fzf.enable = true;
    libqcalculate.enable = true;
    calcure.enable = true;
    pulsemixer.enable = true;
  };
}
