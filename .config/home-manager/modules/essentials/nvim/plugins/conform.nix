{pkgs, ...}: {
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };
      logLevel = "debug";
      notifyOnError = true;
      formatters = {
        prettierd = {
          command = "${pkgs.prettierd}/bin/prettierd";
        };

        alejandra = {
          command = "${pkgs.alejandra}/bin/alejandra";
        };

        yamlfmt = {
          command = "${pkgs.yamlfmt}/bin/alejandra";
        };

        gofumpt = {
          command = "${pkgs.gofumpt}/bin/gofumpt";
        };

        goimports-reviser = {
          command = "${pkgs.goimports-reviser}/bin/goimports-reviser";
        };

        golines = {
          command = "${pkgs.golines}/bin/golines";
        };

        black = {
          command = "${pkgs.black}/bin/black";
        };
      };
      formattersByFt = {
        html = ["prettierd"];
        css = ["prettierd"];
        javascript = ["prettierd"];
        javascriptreact = ["prettierd"];
        typescript = ["prettierd"];
        typescriptreact = ["prettierd"];
        nix = ["alejandra"];
        markdown = ["prettierd"];
        yaml = ["yamlfmt"];
        go = ["gofumpt" "goimports-reviser golines"];
        python = ["reorder-python-imports" "black"];
        "*" = ["trim_whitespace"];
      };
    };
  };
}
