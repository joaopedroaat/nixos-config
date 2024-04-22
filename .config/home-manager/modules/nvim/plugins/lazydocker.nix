{
  pkgs,
  lazydocker-nvim,
  ...
}: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins =
          prev.vimPlugins
          // {
            lazydocker = prev.vimUtils.buildVimPlugin {
              name = "lazydocker";
              src = lazydocker-nvim;
            };
          };
      })
    ];
  };

  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      lazydocker
      nui-nvim
    ];

    extraConfigLua = ''require("lazydocker").setup()'';

    keymaps = [
      {
        key = "<leader>dd";
        action = "<cmd>LazyDocker<CR>";
        options = {desc = "Open LazyDocker";};
      }
    ];
  };
}
