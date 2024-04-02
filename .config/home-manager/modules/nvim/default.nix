{
  lib,
  config,
  ...
}: {
  imports = [
    ./plugins
    ./keymaps.nix
    ./options.nix
    ./coloscheme.nix
    ./autoCmd.nix
  ];
  options.nvim.enable = lib.mkEnableOption "Neovim";
  config = lib.mkIf config.nvim.enable {
    programs.nixvim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
    };
  };
}
