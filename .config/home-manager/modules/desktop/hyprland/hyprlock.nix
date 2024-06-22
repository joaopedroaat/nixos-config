{
  lib,
  config,
  inputs,
  pkgs,
  ...
}: let
  font_family = "JetBrainsMono Nerd Font";

  baterryLevelScript = pkgs.pkgs.writeShellScriptBin "baterry" ''
    #!/usr/bin/env bash

    battery_level=$(cat /sys/class/power_supply/BAT*/capacity)
    baterry_status=$(cat /sys/class/power_supply/BAT*/status)
    format=""

    if [[ $baterry_status == "Charging" ]]; then
      format="󱐋"
    fi

    if (( battery_level <= 5 )); then
      format="$format  $battery_level%"
      elif ((battery_level < 50)); then
        format="$format  $battery_level%"
      elif ((battery_level < 75)); then
        format="$format  $battery_level%"
      elif ((battery_level < 100)); then
        format="$format  $battery_level%"
      else
        format="$format  $battery_level%"
    fi

    echo "$format"
  '';
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
          font_size = 48;
          color = "rgb(110, 106, 134)";

          position = {
            x = 20;
            y = -90;
          };

          valign = "bottom";
          halign = "left";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] ${baterryLevelScript}/bin/baterry'';
          inherit font_family;
          font_size = 16;
          color = "rgb(110, 106, 134)";

          position = {
            x = -16;
            y = -16;
          };

          valign = "top";
          halign = "right";
        }
      ];
    };
  };
}
