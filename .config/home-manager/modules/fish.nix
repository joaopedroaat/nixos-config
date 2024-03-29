{
  lib,
  config,
  ...
}: {
  options.fish.enable = lib.mkEnableOption "Fish";
  config = lib.mkIf config.fish.enable {
    programs.fish = {
      enable = true;
      shellInit = ''
        set -U fish_greeting
      '';
    };
  };
}
