{
  lib,
  config,
  inputs,
  ...
}: let
  font_family = "JetBrainsMono Nerd Font";
in {
  imports = [inputs.hyprlock.homeManagerModules.hyprlock];
  options.hyprlock.enable = lib.mkEnableOption "Hyprlock";
  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      backgrounds = [
        {
          path = "${./assets/hyprlock-background.png}";
          color = "rgba(25, 23, 36, 1)";
        }
      ];

      input-fields = [
        {
          monitor = "";

          size = {
            width = 300;
            height = 20;
          };

          outline_thickness = 1;

          outer_color = "rgb(38, 35, 58)";
          inner_color = "rgb(31, 29, 46)";
          font_color = "rgb(144, 140, 170)";

          fade_on_empty = true;

          rounding = 6;

          dots_spacing = 0.3;
          dots_center = true;

          position = {
            x = 0;
            y = 0;
          };

          halign = "center";
          valign = "center";
        }
      ];

      labels = [
        {
          monitor = "";
          text = "$TIME";
          inherit font_family;
          font_size = 50;
          color = "rgb(110, 106, 134)";

          position = {
            x = 20;
            y = 80;
          };

          valign = "bottom";
          halign = "left";
        }
      ];
    };
  };
}
