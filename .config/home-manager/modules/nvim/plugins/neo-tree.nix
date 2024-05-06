{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      neo-tree-nvim
    ];

    keymaps = [
      {
        key = "<leader>e";
        action = "<cmd>Neotree reveal toggle<CR>";
        options = {desc = "Open Neotree";};
      }
    ];
  };
}
