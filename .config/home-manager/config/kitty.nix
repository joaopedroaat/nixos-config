{...}: {
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
    };

    theme = "Gruvbox Dark";

    settings = {
      confirm_os_window_close = 0;
      window_padding_width = "0 8";
    };
  };
}
