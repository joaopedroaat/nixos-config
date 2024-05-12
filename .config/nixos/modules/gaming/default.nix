{
  lib,
  config,
  ...
}: {
  imports = [
    ./steam.nix
    ./lutris.nix
  ];

  options.gaming.enable = lib.mkEnableOption "Gaming";
  config = lib.mkIf config.gaming.enable {
    steam.enable = true;
    lutris.enable = true;
  };
}
