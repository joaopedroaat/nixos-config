{...}: {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      keymaps = {
        lspBuf = {
          "<S-k>" = "hover";
          "g<S-d>" = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
          "<leader>ca" = "code_action";
          "<leader>cr" = "rename";
        };
      };
      servers = {
        nil_ls.enable = true;
        lua-ls.enable = true;
        tsserver.enable = true;
        tailwindcss.enable = true;
      };
    };
  };
}
