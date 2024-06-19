{
  lib,
  config,
  ...
}: {
  options.zsh.enable = lib.mkEnableOption "Zsh";
  config = lib.mkIf config.zsh.enable {
    programs.zsh.enable = true;
  };
}
