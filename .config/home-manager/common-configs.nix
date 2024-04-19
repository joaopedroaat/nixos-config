{
  pkgs,
  lib,
  ...
}: {
  home.username = "joaopedroaat";
  home.homeDirectory = "/home/joaopedroaat";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xdg.enable = true;
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  gtk = {
    enable = true;
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
  };

  # Unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "discord"
      "spotify"
    ];

  imports = [./modules];

  fish.enable = true;
  git.enable = true;
  hyprlock.enable = true;
  kitty.enable = true;
  ssh.enable = true;
  tmux.enable = true;
  nvim.enable = true;
  hyprland.enable = true;
  discord.enable = true;
  volta.enable = true;
  golang.enable = true;
  insomnia.enable = true;
  google-cloud.enable = true;
  openssl.enable = true;

  programs.home-manager.enable = true;
}
