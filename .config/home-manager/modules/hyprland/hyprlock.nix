{
  lib,
  config,
  ...
}: let
  font_family = "JetBrainsMono Nerd Font";
in {
  options.hyprlock.enable = lib.mkEnableOption "Hyprlock";
  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      backgrounds = [
        {
          path = "${./hyprlock-background.png}";
          color = "rgba(25, 23, 36, 1)";
        }
      ];

      input-fields = [
        {
          monitor = "";

          size = {
            width = 300;
            height = 50;
          };

          outline_thickness = 2;

          outer_color = "rgb(235, 111, 146)";
          inner_color = "rgb(31, 29, 46)";
          font_color = "rgb(224, 222, 244)";

          fade_on_empty = true;

          dots_spacing = 0.3;
          dots_center = true;
        }
      ];

      labels = [
        {
          monitor = "";
          text = "$TIME";
          inherit font_family;
          font_size = 50;
          color = "rgb(235, 111, 146)";

          position = {
            x = 0;
            y = 80;
          };

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
