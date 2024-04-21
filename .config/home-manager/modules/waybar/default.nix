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
          "layer" = "top"; # Waybar at top layer
          "position" = "top"; # Waybar at the bottom of your screen
          "height" = 24; # Waybar height
          # "width"= 1366; # Waybar width
          # Choose the order of the modules
          "modules-left" = ["hyprland/workspaces" "hyprland/submap"];
          "modules-center" = ["hyprland/window"];
          "modules-right" = ["pulseaudio" "network" "cpu" "memory" "battery" "tray" "clock"];
          "hyprland/workspaces" = {
            "disable-scroll" = true;
            "all-outputs" = false;
            "format" = "{id} {icon}";
            "format-icons" = {
              "urgent" = "";
              "default" = "";
            };
          };
          "hyprland/submap" = {
            "format" = "<span style=\"italic\">{}</span>";
          };
          "tray" = {
            # "icon-size"= 21;
            "spacing" = 10;
          };
          "clock" = {
            "format-alt" = "{:%Y-%m-%d}";
          };
          "cpu" = {
            "format" = " {usage}%";
          };
          "memory" = {
            "format" = " {}%";
          };
          "battery" = {
            "bat" = "BAT0";
            "states" = {
              # "good"= 95;
              "warning" = 30;
              "critical" = 15;
            };
            "format" = "{capacity}% {icon}";
            # "format-good"= ""; # An empty format will hide the module
            # "format-full"= "";
            "format-icons" = ["" "" "" "" ""];
          };
          "network" = {
            # "interface"= "wlp2s0"; # (Optional) To force the use of this interface
            "format-wifi" = " {essid}";
            "format-ethernet" = "{ifname}: {ipaddr}/{cidr} ";
            "format-disconnected" = "Disconnected ⚠";
          };
          "pulseaudio" = {
            #"scroll-step"= 1;
            "format" = "{icon} {volume}%";
            "format-bluetooth" = "{icon} {volume}% ";
            "format-muted" = "";
            "format-icons" = {
              "headphones" = "";
              "handsfree" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = ["" ""];
            };
            "on-click" = "kitty --class pulsemixer -e pulsemixer";
          };
        };
      };

      style = ./style.css;
    };
  };
}
