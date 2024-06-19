{
  lib,
  config,
  ...
}: {
  options.zsh.enable = lib.mkEnableOption "Zsh";
  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      autocd = true;
      defaultKeymap = "vicmd";

      oh-my-zsh = {
        enable = true;
        plugins = [
          "sudo"
        ];
      };
    };
  };
}
