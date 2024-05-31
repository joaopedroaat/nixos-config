{...}: {
  programs.nixvim = {
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

    # Clipboard
    clipboard.providers.xclip.enable = true;
    clipboard.register = "unnamedplus";
  };
}
