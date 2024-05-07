{
  pkgs,
  lib,
  config,
  ...
}: {
  options.waybar.enable = lib.mkEnableOption "Waybar";
  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;

      style = ./style.css;

      settings = [
        {
          # Settings
          "layer" = "top";
          "position" = "top";
          "margin" = "4";
          "height" = 13;
          "reload_style_on_change" = true;
          # Modules
          "modules-left" = [
            "custom/nixos-icon"
            "hyprland/workspaces"
            "hyprland/window"
          ];
          "modules-center" = [];
          "modules-right" = [
            "group/tray"
            "group/volume"
            "clock"
            "group/power"
          ];
          # Modules settings
          "custom/nixos-icon" = {
            "format" = "";
            "on-click-left" = "hyprctl dispatch workspace 1";
          };
          "hyprland/workspaces" = {
            "format" = "{icon} <span font_size=\"x-small\" rise=\"1pt\">-></span> {windows}";
            "window-rewrite-default" = " ";
            "window-rewrite" = {
              "class<kitty>" = "󰆍 ";
              "class<kitty> title<tmux*>" = "󰙀 ";
              "class<kitty> title<nvim*>" = "󰈮 ";
              "class<firefox>" = "󰈹 ";
              "class<Spotify>" = "󰓇 ";
              "class<discord>" = "󰙯 ";
              "class<1Password>" = "󱦚 ";
              "class<steam>" = "󰓓 ";
              "class<com.usebottles.bottles>" = "󱄮 ";
              "class<lutris>" = " ";
            };
          };
          "hyprland/window" = {
            "max-length" = 40;
          };
          "clock" = {
            "format" = "{:%R}";
            "format-alt" = "<span text_transform=\"capitalize\">{:%a, %d %b %Y}</span>";
            "on-click-right" = "kitty --class calcure -e calcure";
          };
          # Pulseaudio
          "group/volume" = {
            "orientation" = "inherit";
            "drawer" = {
              "transition-duration" = 500;
              "children-class" = "volume-group-children";
              "transition-left-to-right" = true;
            };
            "modules" = [
              "pulseaudio"
              "pulseaudio/slider"
            ];
          };
          "pulseaudio" = {
            "format" = "{volume}% {icon}";
            "format-bluetooth" = "{volume}% {icon}";
            "format-muted" = "<span foreground=\"#eb6f92\"> muted</span>";
            "format-icons" = {
              "headphone" = "";
              "hands-free" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = [
                ""
                ""
              ];
            };
            "scroll-step" = 1;
            "on-click" = "${pkgs.pulsemixer}/bin/pulsemixer --toggle-mute";
            "on-click-right" = "kitty --class pulsemixer -e pulsemixer";
            "ignored-sinks" = [
              "Easy Effects Sink"
            ];
          };
          # Power
          "group/power" = {
            "orientation" = "inherit";
            "drawer" = {
              "transition-duration" = 500;
              "children-class" = "power-group-children";
              "transition-left-to-right" = false;
            };
            "modules" = [
              "custom/power" # First element is the "group leader" and won't ever be hidden
              "custom/quit"
              "custom/lock"
              "custom/reboot"
            ];
          };
          "custom/quit" = {
            "format" = "<span rise=\"4pt\">󰍃</span>";
            "tooltip" = false;
            "on-click" = "hyprctl dispatch exit";
          };
          "custom/lock" = {
            "format" = "<span rise=\"4pt\">󰍁</span>";
            "tooltip" = false;
            "on-click" = "hyprlock";
          };
          "custom/reboot" = {
            "format" = "<span rise=\"4pt\" >󰜉</span>";
            "tooltip" = false;
            "on-click" = "reboot";
          };
          "custom/power" = {
            "format" = "<span rise=\"4pt\">󰐥</span>";
            "tooltip" = false;
            "on-click" = "shutdown now";
          };
          # Tray
          "group/tray" = {
            "orientation" = "inherit";
            "drawer" = {
              "transition-duration" = 500;
              "children-class" = "tray-group-children";
              "transition-left-to-right" = false;
            };
            "modules" = [
              "custom/tray-leader"
              "tray"
            ];
          };
          "custom/tray-leader" = {
            "format" = "󱕷";
            "tooltip" = false;
          };
          "tray" = {
            "icon-size" = 13;
            "spacing" = 8;
          };
        }
      ];
    };
  };
}
