{pkgs, ...}: {
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      currentLineBlame = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      lazygit-nvim
    ];

    keymaps = [
      # Git
      {
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options = {desc = "Open LazyGit";};
      }
      {
        key = "<leader>gp";
        action = "<cmd>Gitsigns preview_hunk<CR>";
        options = {desc = "Preview Hunk";};
      }
    ];
  };
}
