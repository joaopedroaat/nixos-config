{
  pkgs,
  lib,
  config,
  ...
}: {
  options.grapejuice.enable = lib.mkEnableOption "Grapejuice (Roblox)";
  config = lib.mkIf config.grapejuice.enable {
    environment.systemPackages = with pkgs; [
      grapejuice
    ];
  };
}
