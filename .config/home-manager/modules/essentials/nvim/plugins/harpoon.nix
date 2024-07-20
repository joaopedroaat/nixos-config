{...}: {
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;

      #Enable telescope support
      enableTelescope = true;

      # Mark files on save
      saveOnToggle = false;

      # Save harpoon files on change
      saveOnChange = true;

      # Each git branch has it's own marks
      markBranch = true;
    };

    keymaps = let
      harpoon-ui = "<cmd>lua require('harpoon.ui')";
      harpoon-mark = "<cmd>lua require('harpoon.mark')";
    in [
      {
        action = "<cmd>Telescope harpoon marks<CR>";
        key = "<leader>fm";
        options = {desc = "Find marks (Telescope)";};
      }
      {
        mode = "n";
        action = "${harpoon-ui}.toggle_quick_menu()<CR>";
        key = "mq";
        options = {desc = "Find marks (Harpoon)";};
      }
      {
        mode = "n";
        action = "${harpoon-mark}.add_file()<CR>";
        key = "ma";
        options = {desc = "Mark file";};
      }
      {
        mode = "n";
        action = "${harpoon-ui}.nav_next()<CR>";
        key = "mn";
        options = {desc = "Next mark";};
      }
      {
        mode = "n";
        action = "${harpoon-ui}.nav_prev()<CR>";
        key = "mp";
        options = {desc = "Prev mark";};
      }
    ];
  };
}
