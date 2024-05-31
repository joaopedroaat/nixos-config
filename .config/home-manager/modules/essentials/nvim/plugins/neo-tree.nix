{...}: {
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      autoCleanAfterSessionRestore = true;
    };

    keymaps = [
      {
        key = "<leader>e";
        action = "<cmd>Neotree reveal toggle<CR>";
        options = {desc = "Open Neotree";};
      }
    ];
  };
}
