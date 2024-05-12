{...}: {
  programs.nixvim = {
    plugins.oil.enable = true;

    keymaps = [
      {
        key = "<leader>o";
        action = "<cmd>Oil --float .<CR>";
        options = {desc = "Find Oil";};
      }
    ];
  };
}
