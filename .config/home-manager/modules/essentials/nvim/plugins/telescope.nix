{pkgs, ...}: {
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      defaults = {
        mappings = let
          actions = "require('telescope.actions')";
        in {
          n = {
            "<C-d>" = {
              __raw = "${actions}.delete_buffer";
            };
          };
          i = {
            "<C-h>" = {__raw = "${actions}.which_key";};
            "<C-d>" = {__raw = "${actions}.delete_buffer";};
          };
        };
      };
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

        "<leader><leader>" = {
          action = "buffers";
          desc = "Find Buffers";
        };

        "<leader>fh" = {
          action = "help_tags";
          desc = "Find Help";
        };
      };
    };

    # Telescope dependencies
    extraPackages = with pkgs; [
      fd
      ripgrep
    ];
  };
}
