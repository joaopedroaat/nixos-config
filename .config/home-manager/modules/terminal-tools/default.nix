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
    ./wl-clipboard.nix
    ./swww.nix
    ./imagemagick.nix
    ./compression.nix
  ];

  options.terminal-tools.enable = lib.mkEnableOption "Terminal tools";
  config = lib.mkIf config.terminal-tools.enable {
    fzf.enable = true;
    libqcalculate.enable = true;
    calcure.enable = true;
    pulsemixer.enable = true;
    imagemagick.enable = true;
    compression.enable = true;
  };
}
