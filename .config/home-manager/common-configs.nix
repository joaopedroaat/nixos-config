{
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

  # Unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "discord"
      "spotify"
    ];

  imports = [./modules];

  essential.enable = true;
  desktop.enable = true;
  development.enable = true;
  terminal-tools.enable = true;
  rose-pine.enable = true;

  programs.home-manager.enable = true;
}
