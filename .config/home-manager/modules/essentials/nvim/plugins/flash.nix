{...}: {
  programs.nixvim = {
    plugins.flash = {
      enable = true;
    };

    keymaps = [
      # Git
      {
        key = "f";
        mode = ["n" "x" "o"];
        action = "<cmd>lua require('flash').jump()<CR>";
        options = {desc = "Flash";};
      }
      {
        key = "F";
        mode = ["n" "x" "o"];
        action = "<cmd>lua require('flash').treesitter()<CR>";
        options = {desc = "Flash Treesitter";};
      }
      {
        key = "r";
        mode = ["o"];
        action = "<cmd>lua require('flash').remote()<CR>";
        options = {desc = "Remote Flash";};
      }
      {
        key = "R";
        mode = ["o" "x"];
        action = "<cmd>lua require('flash').treesitter_search()<CR>";
        options = {desc = "Treesitter Search";};
      }
      {
        key = "<c-f>";
        mode = ["c"];
        action = "<cmd>lua require('flash').toggle()<CR>";
        options = {desc = "Toggle Flash Search";};
      }
    ];
  };
}
