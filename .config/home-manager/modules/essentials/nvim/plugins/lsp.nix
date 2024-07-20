{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      yuck-vim
    ];

    plugins.lsp = {
      enable = true;
      keymaps = {
        lspBuf = {
          "<S-k>" = {
            action = "hover";
            desc = "Hover";
          };
          "g<S-d>" = {
            action = "references";
            desc = "References";
          };
          gd = {
            action = "definition";
            desc = "Definitions";
          };
          gi = {
            action = "implementation";
            desc = "Implementation";
          };
          gt = {
            action = "type_definition";
            desc = "Type Definition";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Action";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>j" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "<leader>k" = {
            action = "goto_prev";
            desc = "Prev Diagnostic";
          };
          "<leader>cd" = {
            action = "open_float";
            desc = "Diagnostic";
          };
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
        bashls.enable = true;
      };
    };
  };
}
