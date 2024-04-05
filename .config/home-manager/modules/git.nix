{
  pkgs,
  lib,
  config,
  ...
}: {
  options.git.enable = lib.mkEnableOption "Git";
  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "joaopedroaat";
      userEmail = "joaopedroaat@outlook.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    home.packages = with pkgs; [
      lazygit
    ];
  };
}
