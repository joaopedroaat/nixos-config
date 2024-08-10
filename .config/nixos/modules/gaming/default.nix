{
  lib,
  config,
  ...
}: {
  imports = [
    ./steam.nix
    ./lutris.nix
    ./grapejuice.nix
  ];

  options.gaming.enable = lib.mkEnableOption "Gaming";
  config = lib.mkIf config.gaming.enable {
    steam.enable = true;
    lutris.enable = true;
    grapejuice.enable = true;
  };
}
