{pkgs, ...}: {
  imports = [
    ./nvim
    ./git.nix
    ./xdg.nix
    ./fish.nix
    ./ui
  ];

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

  programs.home-manager.enable = true;
}
