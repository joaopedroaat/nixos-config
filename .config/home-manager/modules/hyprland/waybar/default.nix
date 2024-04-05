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
            "custom/light-arrow-right"
          ];
          modules-center = [
            "hyprland/window"
          ];
          modules-right = [
            "custom/light-arrow-left"
            "pulseaudio"
            "network"
            "clock"
          ];

          # Modules Settings
          tray = {
            tooltip = false;
            spacing = 5;
          };

          clock = {
            "format" = "{:%d %b %Y, %OH:%M}";
            "tooltip-format" = "<tt><small>{calendar}</small></tt>";
            "calendar" = {
              "mode" = "month";
              "mode-mon-col" = 3;
              "weeks-pos" = "left";
              "on-scroll" = 1;
              "format" = {
                "months" = "<span color='#d4be98'><b>{}</b></span>";
                "days" = "<span color='#d4be98'><b>{}</b></span>";
                "weeks" = "<span color='#a9b665'><b>W{}</b></span>";
                "weekdays" = "<span color='#d8a657'><b>{}</b></span>";
                "today" = "<span color='#e78a4e'><b><u>{}</u></b></span>";
              };
              "actions" = {
                "on-click-middle" = "mode";
                "on-scroll-up" = "Shift_up";
                "on-scroll-down" = "shift_down";
              };
              "on-click" = "kitty --class=waybar/calcure -e calcure";
            };
          };

          network = {
            "format-wifi" = "";
            "format-ethernet" = "";
            "format-linked" = "";
            "format-disconnected" = "⚠";
            "tooltip-format" = "{essid}\n{ipaddr}/{cidr}";
            "tooltip" = true;
            #"on-click" = "kitty --class=nmtui -e nmtui";
          };

          pulseaudio = {
            "scroll-step" = 1;
            "format" = "{volume}% {icon} {format_source}";
            "format-bluetooth" = "{volume}% {icon} {format_source}";
            "format-bluetooth-muted" = "<span foreground='#ea6962'>  {format_source}</span>";
            "format-muted" = "<span foreground='#ea6962'></span> {format_source}";
            "format-source" = " ";
            "format-source-muted" = " <span foreground='#ea6962'></span>";
            "format-icons" = {
              "headphone" = "";
              "headset" = "";
              "default" = ["" "" ""];
            };
            "tooltip" = false;
            "on-click" = "kitty --class=waybar/pulsemixer -e pulsemixer";
            "ignored-sinks" = ["Easy Effects Sink" "Monitor of Easy Effects Sink"];
          };

          "custom/light-arrow-left" = {
            "tooltip" = false;
            "format" = "";
          };

          "custom/dark-arrow-left" = {
            "tooltip" = false;
            "format" = "";
          };

          "custom/light-arrow-right" = {
            "tooltip" = false;
            "format" = "";
          };

          "custom/dark-arrow-right" = {
            "tooltip" = false;
            "format" = "";
          };
        };
      };

      style = ./style.css;
    };
  };
}
