{pkgs, ...}: {
  home.stateVersion = "23.11"; # Do not change

  home.packages = with pkgs; [
    # Clipboard
    wl-clipboard
    # Telescope dependencies
    fd
    ripgrep
    # Spotify
    spotify
    # Formatters
    nixpkgs-fmt
    prettierd
    yamlfmt
    alejandra
    # Lazygit
    lazygit
    # Wayland/Hyprland stuff
    swww
    dunst
    rofi-wayland
    libnotify
    # Web Browser
    firefox
    # Volta
    volta
  ];
}
