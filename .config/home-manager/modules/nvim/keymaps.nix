{...}: {
  programs.nixvim = {
    keymaps = [
      {
        key = "<leader>o";
        action = "<cmd>Oil --float .<CR>";
        options = {desc = "Find Oil";};
      }
      {
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options = {desc = "Open Neotree";};
      }
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
