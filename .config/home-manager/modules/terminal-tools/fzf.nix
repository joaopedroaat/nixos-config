{
  lib,
  config,
  ...
}: {
  options.fzf.enable = lib.mkEnableOption "Terminal tools";
  config = lib.mkIf config.fzf.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
