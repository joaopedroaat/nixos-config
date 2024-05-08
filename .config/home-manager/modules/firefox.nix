{
  lib,
  config,
  ...
}: {
  options.firefox.enable = lib.mkEnableOption "Firefox";
  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
