{
  lib,
  config,
  ...
}: {
  options.golang.enable = lib.mkEnableOption "Golang";
  config = lib.mkIf config.golang.enable {
    programs.go = {
      enable = true;
      goPath = ".go";
    };
  };
}
