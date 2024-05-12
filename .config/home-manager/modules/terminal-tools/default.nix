{
  lib,
  config,
  ...
}: {
  imports = [
    ./fzf.nix
    ./libqcalculate.nix
    ./calcure.nix
    ./pulsemixer.nix
    ./imagemagick.nix
    ./compression.nix
    ./netcat.nix
    ./bat.nix
  ];

  options.terminal-tools.enable = lib.mkEnableOption "Terminal tools";
  config = lib.mkIf config.terminal-tools.enable {
    fzf.enable = true;
    libqcalculate.enable = true;
    calcure.enable = true;
    pulsemixer.enable = true;
    imagemagick.enable = true;
    compression.enable = true;
    netcat.enable = true;
    bat.enable = true;
  };
}
