{
  lib,
  config,
  ...
}: {
  options.hyprlock.enable = lib.mkEnableOption "Hyprlock";
  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
    };
  };
}
