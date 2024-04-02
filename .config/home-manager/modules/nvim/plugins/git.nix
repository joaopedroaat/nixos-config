{pkgs, ...}: {
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      currentLineBlame = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      lazygit-nvim
    ];
  };
}
