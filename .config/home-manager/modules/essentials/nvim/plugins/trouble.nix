{...}: {
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
    };

    keymaps = [
      {
        key = "<leader>tt";
        action = "<cmd>TroubleToggle<CR>";
        options = {desc = "Trouble File";};
      }
      {
        key = "<leader>tw";
        action = "<cmd>TroubleToggle workspace_diagnostics<CR>";
        options = {desc = "Trouble Workspace";};
      }
      {
        key = "<leader>tq";
        action = "<cmd>TroubleToggle quickfix<CR>";
        options = {desc = "Trouble Quickfix";};
      }
    ];
  };
}
