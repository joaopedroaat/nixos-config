{
  lib,
  config,
  ...
}: {
  options.bat.enable = lib.mkEnableOption "Bat";
  config = lib.mkIf config.bat.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = "base16";
      };
    };
  };
}
