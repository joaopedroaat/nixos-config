{...}: {
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          desc = "Find Files";
        };

        "<leader>fg" = {
          action = "live_grep";
          desc = "Find Text";
        };

        "<leader>fb" = {
          action = "buffers";
          desc = "Find Buffers";
        };

        "<leader>fh" = {
          action = "help_tags";
          desc = "Find Help";
        };
      };
    };
  };
}
