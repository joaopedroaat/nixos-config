{...}: {
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

      winOptions = {
        wrap = true;
      };

      keymaps = {
        "<C-c>" = false;
        "q" = "actions.close";
        "t" = "actions.select";
      };
    };

    keymaps = [
      {
        key = "-";
        action = "<cmd>Oil<CR>";
        options = {desc = "Oil parent directory";};
      }
    ];
  };
}
