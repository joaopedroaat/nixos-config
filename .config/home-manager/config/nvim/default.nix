{pkgs, ...}: {
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    # Colorscheme
    colorschemes.gruvbox.enable = true;

    # Options
    globals.mapleader = " ";

    options = {
      # Searching
      hlsearch = true; # Highlight all matches on previous search pattern
      ignorecase = false; # Ignore case in search patterns
      # Mouse
      mouse = "a"; # Enable mouse support
      # Encoding
      fileencoding = "utf-8"; # The encoding written to a file
      # Splits
      splitright = true; # Vertical splits to right
      splitbelow = true; # Horizontal splits to bottom
      # Swap files
      swapfile = false; # Creates a swap file
      # Terminal colors
      termguicolors = true; # Set terminal gui colors
      updatetime = 300; # Faster completion
      # Line numbers
      number = true;
      relativenumber = true;
      # Identation
      expandtab = true; # Convert tabs to spaces
      shiftwidth = 2; # Number of spaces for each identation
      tabstop = 2; # Insert 2 spaces for a tab
      # SignColumn
      signcolumn = "yes";
      # Lines out
      scrolloff = 8;
      sidescrolloff = 8;
    };

    # Remove Highlight from SignColumn
    autoCmd = [
      {
        event = "VimEnter";
        command = "highlight clear SignColumn";
        once = true;
        desc = "Remove signcolumn highlight";
      }
    ];

    # Clipboard
    clipboard.providers.xclip.enable = true;
    clipboard.register = "unnamedplus";

    keymaps = [
      {
        key = "<leader>o";
        action = "<cmd>Oil --float .<CR>";
        options = {desc = "Find Oil";};
      }
      {
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options = {desc = "Open Neotree";};
      }
      # Git
      {
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options = {desc = "Open LazyGit";};
      }
      {
        key = "<leader>gp";
        action = "<cmd>Gitsigns preview_hunk<CR>";
        options = {desc = "Preview Hunk";};
      }
    ];

    # Plugins
    plugins = {
      lualine.enable = true;
      oil.enable = true;
      which-key.enable = true;
      fugitive.enable = true;
      tmux-navigator.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      lazygit-nvim
      dressing-nvim
      neo-tree-nvim
    ];

    plugins.gitsigns = {
      enable = true;
      currentLineBlame = true;
    };

    plugins.mini = {
      enable = true;
      modules = {
        pairs.enable = true;
        move.enable = true;
        comment.enable = true;
      };
    };

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
        "*" = ["trim_whitespace"];
      };
    };

    plugins.lsp = {
      enable = true;
      keymaps = {
        lspBuf = {
          "<S-k>" = "hover";
          "g<S-d>" = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      servers = {
        nil_ls.enable = true;
        lua-ls.enable = true;
        tsserver.enable = true;
      };
    };

    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
    };

    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          desc = "Find Files";
        };

        "<leader>fg" = {
          action = "live_grep";
          desc = "Find Text";
        };

        "<leader>fb" = {
          action = "buffers";
          desc = "Find Buffers";
        };

        "<leader>fh" = {
          action = "help_tags";
          desc = "Find Help";
        };
      };
    };
  };
}
