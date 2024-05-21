{
  lib,
  config,
  pkgs,
  ...
}: {
  options.notifications.enable = lib.mkEnableOption "Notifications";
  config = lib.mkIf config.notifications.enable {
    home.packages = with pkgs; [
      libnotify
    ];
    services.dunst = {
      enable = true;
      iconTheme = {
        name = "rose-pine";
        package = pkgs.rose-pine-gtk-theme;
      };
      settings = {
        global = {
          monitor = 0;
          follow = "none";

          # Allow regex on filtering rules
          enable_posix_regex = true;

          width = 250;
          height = 100;
          offset = "8x8";

          gap_size = 4;

          # Other notifications will wait on the queue
          notification_limit = 5;

          origin = "top-right";

          progress_bar = true;

          font = "JetBrainsMono Nerd Font 10";

          icon_theme = "rose-pine";
          frame_width = 1;
          frame_color = "#e0def4";

          background = "#26233a";
          foreground = "#e0def4";

          default_icon = "~/.config/dunst/default.svg";

          text_icon_padding = 12;

          # Shortcuts
          close = "ctrl+space";
          close_all = "ctrl+shift+space";
          history = "ctrl+grave";
          context = "ctrl+shift+period";
        };

        /*
        urgency_low = {
        frame_color = "#f6c177";
        new_icon = "~/.config/dunst/warning.svg";
        };
        */

        urgency_critical = {
          frame_color = "#eb6f92";
          new_icon = "~/.config/dunst/danger.svg";
        };
      };
    };
  };
}
