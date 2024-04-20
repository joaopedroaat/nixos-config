{
  lib,
  config,
  ...
}: {
  options.waybar.enable = lib.mkEnableOption "Waybar";
  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 12;

          modules-left = [
            "hyprland/workspaces"
          ];

          modules-right = [
            "hyprland/window"
          ];
        };
      };

      style = ./style.css;
    };
  };
}
