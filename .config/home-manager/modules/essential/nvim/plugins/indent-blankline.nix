{...}: {
  programs.nixvim = {
    plugins.indent-blankline = {
      enable = true;
      whitespace = {
        removeBlanklineTrail = true;
      };
      scope = {
        showStart = false;
        showEnd = false;
      };
      exclude = {
        filetypes = [
          "help"
          "alpha"
          "dashboard"
          "neo-tree"
          "Trouble"
          "trouble"
          "lazy"
          "mason"
          "notify"
          "toggleterm"
          "lazyterm"
        ];
      };
    };
  };
}
