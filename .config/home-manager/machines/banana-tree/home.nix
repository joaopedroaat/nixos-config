{pkgs, ...}: {
  home.stateVersion = "23.11"; # Do not change

  home.packages = with pkgs; [
    # Clipboard
    wl-clipboard
    # Telescope dependencies
    fd
    ripgrep
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
