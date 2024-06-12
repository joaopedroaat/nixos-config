{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      yuck-vim
    ];

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
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
          "<leader>cd" = "open_float";
        };
      };
      servers = {
        nil_ls.enable = true;
        lua-ls.enable = true;
        tsserver.enable = true;
        cssls = {
          enable = true;
          extraOptions = {
            settings = {
              css = {
                validate = true;
                lint = {
                  unknownAtRules = "ignore";
                };
              };
              scss = {
                validate = true;
                lint = {
                  unknownAtRules = "ignore";
                };
              };
              less = {
                validate = true;
                lint = {
                  unknownAtRules = "ignore";
                };
              };
            };
          };
        };
        tailwindcss.enable = true;
        gopls.enable = true;
        dockerls.enable = true;
        jsonls.enable = true;
        html.enable = true;
        htmx.enable = true;
        pylsp.enable = true;
      };
    };
  };
}
