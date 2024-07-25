{pkgs, ...}: {
  programs.nixvim = {
    plugins.oil = {
      enable = true;

      deleteToTrash = true;
      skipConfirmForSimpleEdits = true;
      defaultFileExplorer = true;

      viewOptions = {
        showHidden = true;
        isAlwaysHidden = ''
          function()
            return name == ".." or name == ".git"
          end
        '';
      };

      columns = {
        icon = {
          enable = true;
        };
      };

      winOptions = {
        wrap = true;
      };

      keymaps = {
        "<C-c>" = false;
        "q" = "actions.close";
        "f" = "actions.select";
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
    ];

    keymaps = [
      {
        key = "-";
        action = "<cmd>Oil<CR>";
        options = {desc = "Oil parent directory";};
      }
    ];
  };
}
