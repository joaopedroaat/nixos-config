{pkgs, ...}: {
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notifyOnError = true;
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
        "*" = ["trim_whitespace"];
      };
    };

    extraPackages = with pkgs; [
      alejandra
      prettierd
      yamlfmt
      gofumpt
      goimports-reviser
      golines
    ];
  };
}