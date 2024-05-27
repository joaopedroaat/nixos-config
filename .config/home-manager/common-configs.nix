{config, ...}: {
  home.username = "joaopedroaat";
  home.homeDirectory = "/home/joaopedroaat";

  home.sessionVariables = {
    EDITOR = "nvim";
    GTK_THEME = config.gtk.theme.name;
  };

  home.shellAliases = {
    dev = "nix develop";
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    desktopEntries = {
      lf = {
        type = "Application";
        name = "lf";
        comment = "Launches the lf file manager";
        icon = "utilities-terminal";
        terminal = false;
        exec = "kitty -e lf";
        categories = ["ConsoleOnly" "System" "FileTools" "FileManager"];
        mimeType = ["inode/directory"];
        settings = {
          Keywords = "File;Manager;Browser;Explorer;Launcher";
        };
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["lf.desktop"];
        "application/pdf" = ["firefox.desktop"];
      };
    };
  };

  imports = [./modules];

  essential.enable = true;
  desktop.enable = true;
  development.enable = true;
  terminal-tools.enable = true;
  rose-pine.enable = true;

  programs.home-manager.enable = true;
}
