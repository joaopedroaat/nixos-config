{...}: {
  programs.nixvim = {
    plugins.nvim-ufo = {
      enable = true;
      providerSelector =
        /*
        lua
        */
        ''
          function(bufnr, filetype, buftype)
            return {'lsp', 'indent'}
          end
        '';
    };

    options = {
      foldcolumn = "1"; # '0' is not bad
      foldlevel = 99; # Using ufo provider need a large value, feel free to decrease the value
      foldlevelstart = 99;
      foldenable = true;
    };

    keymaps = [
      {
        key = "zR";
        lua = true;
        action = "require(\"ufo\").openAllFolds";
        options = {desc = "Open all folds";};
      }
      {
        key = "zM";
        lua = true;
        action = "require(\"ufo\").closeAllFolds";
        options = {desc = "Close all folds";};
      }
      {
        key = "zK";
        lua = true;
        action =
          /*
          lua
          */
          ''
            function()
              local winid = require("ufo").peekFoldedLinesUnderCursor()
              if not winid then
                vim.lsp.buf.hover()
              end
            end
          '';
        options = {desc = "Peek fold";};
      }
    ];
  };
}
