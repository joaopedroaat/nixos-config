{
  lib,
  config,
  ...
}: {
  options.direnv.enable = lib.mkEnableOption "Direnv";
  config = lib.mkIf config.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
