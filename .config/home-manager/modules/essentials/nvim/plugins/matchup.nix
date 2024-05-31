{...}: {
  programs.nixvim = {
    plugins.vim-matchup = {
      enable = false;
    };

    keymaps = [
      {
        key = "<leader>m";
        lua = true;
        action =
          /*
          lua
          */
          ''
            function()
              local enabled = vim.g.matchup_enabled
              if enabled == 0 then
                  vim.g.matchup_enabled = 1
                else
                  vim.g.matchup_enabled = 0
              end
            end
          '';
        options = {desc = "Toggle matchup";};
      }
    ];
  };
}
