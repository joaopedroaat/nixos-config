{
  lib,
  config,
  pkgs,
  ...
}: {
  options.rose-pine.enable = lib.mkEnableOption "Rosé Pine Theme";
  config = lib.mkIf config.rose-pine.enable {
    # Fix for gtk4 theme
    xdg.configFile = {
      "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
      "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
      "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
    };

    # Cursor
    home.pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 11;
    };

    # GTK
    gtk = {
      enable = true;
      theme = {
        package = pkgs.rose-pine-gtk-theme;
        name = "rose-pine";
      };

      iconTheme = {
        package = pkgs.rose-pine-icon-theme;
        name = "rose-pine";
      };
    };
  };
}
