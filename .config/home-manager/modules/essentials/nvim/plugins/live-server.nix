{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins =
          prev.vimPlugins
          // {
            live-server = prev.vimUtils.buildVimPlugin {
              name = "live-server";
              src = inputs.live-server-nvim;
            };
          };
      })
    ];
  };

  programs.nixvim = {
    extraPackages = with pkgs.nodePackages; [
      live-server
    ];
    extraPlugins = with pkgs.vimPlugins; [
      live-server
    ];

    extraConfigLua = ''require("live-server").setup()'';
  };
}
