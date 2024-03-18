{ config, pkgs, ... }:

{
  home.username = "joaopedroaat";
  home.homeDirectory = "/home/joaopedroaat";

  home.stateVersion = "23.11"; # Do not change

  home.packages = [
    # Clipboard
    pkgs.wl-clipboard

    # Telescope dependencies
    pkgs.fd
    pkgs.ripgrep
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

    # Plugins
    plugins = {
      lualine.enable = true;
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

  wayland.windowManager.hyprland.settings = {
    enable = true;
    "$mod" = "SUPER";
    bind =
      [
        "$mod, F, exec, firefox"
        ", Print, exec, grimblast copy area"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };
}



