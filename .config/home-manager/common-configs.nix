{
  pkgs,
  lib,
  config,
  ...
}: {
  home.username = "joaopedroaat";
  home.homeDirectory = "/home/joaopedroaat";

  home.sessionVariables = {
    EDITOR = "nvim";
    GTK_THEME = config.gtk.theme.name;
  };

  xdg.enable = true;
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  # Fix for gtk4 theme
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 11;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine-icons";
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
  waybar.enable = true;
  terminal-tools.enable = true;

  programs.lf.enable = true;
  programs.rofi.enable = true;

  programs.home-manager.enable = true;
}
