{pkgs, ...}: {
  home.username = "joaopedroaat";
  home.homeDirectory = "/home/joaopedroaat";

  home.stateVersion = "23.11"; # Do not change

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = [
    # Clipboard
    pkgs.wl-clipboard
    # Telescope dependencies
    pkgs.fd
    pkgs.ripgrep
    # Spotify
    pkgs.spotify
    # Formatters
    pkgs.nixpkgs-fmt
    pkgs.prettierd
    pkgs.yamlfmt
    pkgs.alejandra
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # User directories
  xdg.enable = true;
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  programs.home-manager.enable = true;

  # Fish shell
  programs.fish = {
    enable = true;
    shellInit = ''
      set -U fish_greeting
    '';
  };

  programs.git = {
    enable = true;
    userName = "joaopedroaat";
    userEmail = "joaopedroaat@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    envExtra = ''
      export SOMEZSHVARIABLE="something"
    '';
  };

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
      # Signcolumn
      signcolumn = "no"; # Always show the signcolumn
      # Lines out
      scrolloff = 8;
      sidescrolloff = 8;
    };

    clipboard.providers.xclip.enable = true;
    clipboard.register = "unnamedplus";

    keymaps = [
      {
        key = "<leader>e";
        action = "<cmd>Oil --float .<CR>";
        options = {desc = "Find Oil";};
      }
    ];

    # Plugins
    plugins = {
      lualine.enable = true;
      oil.enable = true;
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
