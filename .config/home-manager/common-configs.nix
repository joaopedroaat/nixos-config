{pkgs, ...}: {
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

  imports = [./modules];

  fish.enable = true;
  git.enable = true;
  hyprlock.enable = true;
  kitty.enable = true;
  ssh.enable = true;
  tmux.enable = true;
  waybar.enable = true;
  nvim.enable = true;
  hyprland.enable = true;

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
