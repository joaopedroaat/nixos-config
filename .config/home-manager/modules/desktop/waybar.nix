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
            "group/volume"
            "clock"
            "network"
            "battery"
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
              "class<kitty>" = "󰄛 ";
              "class<kitty> title<tmux.*>" = "󰙀 "; # Catch everything that starts with tmux, no matter what cames next
              "class<kitty> title<nvim.*>" = "󰈮 "; # Catch everything that starts with nvim, no matter what cames next
              "class<kitty> title<lf.*>" = "󰉋 "; # Catch everything that starts with lf, no matter what cames next
              "class<firefox>" = "󰈹 ";
              "class<Spotify>" = "󰓇 ";
              "class<discord>" = "󰙯 ";
              "class<1Password>" = "󱦚 ";
              "class<steam>" = "󰓓 ";
              "class<steam_app.*>" = " ";
              "class<com.usebottles.bottles>" = "󱄮 ";
              "class<lutris>" = " ";
              "class<Gimp.*>" = " ";
              "class<VirtualBox Manager>" = "󰢔 ";
              "class<VirtualBox Machine>" = "󰹑 ";
              "class<VirtualBox Machine> title<Windows.*>" = "󰖳 ";
              "class<libreoffice.*>" = "󰈙 ";
              "class<beekeeper-studio>" = "󰆼 ";
              "class<Insomnia>" = "󰘯 ";
            };
          };
          "hyprland/window" = {
            "max-length" = 40;
          };
          network = {
            "interval" = 1;
            "format" = "{icon}";
            "format-alt" = "{ipaddr}/{cidr} {icon}";
            "format-alt-click" = "click-right";
            "format-icons" = {
              "wifi" = ["󰤟" "󰤢" "󰤥" "󰤨"];
              "ethernet" = ["󰈀"];
              "disconnected" = ["󰪎"];
            };
            "on-click" = "${pkgs.kitty}/bin/kitty -e nmtui";
            "tooltip" = false;
          };
          clock = {
            "interval" = 1;
            "format" = "{:%R}";
            "format-alt" = "<span text_transform=\"capitalize\">{:%a, %d %b %Y %T}</span>";
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
            modules = [
              "pulseaudio"
              "pulseaudio/slider"
            ];
          };
          pulseaudio = {
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
          battery = {
            #"bat" = "BAT2";
            "interval" = 1;
            "states" = {
              "warning" = 30;
              "critical" = 15;
            };
            "format" = "{capacity}% {icon}";
            "format-charging" = "{capacity}% {icon} 󱐋";
            "format-plugged" = "{capacity}% {icon} <span size=\"x-small\"></span>";
            "format-full" = "{capacity}% {icon} <span size=\"x-small\"></span>";
            "format-icons" = ["" "" "" "" ""];
            "max-length" = 25;
          };
        }
      ];

      style =
        /*
        css
        */
        ''
          * {
            font-family: JetBrainsMono Nerd Font;
            font-size: 11px;
            color: #908caa;
          }

          window#waybar {
            background: #191724;
            border: 1px solid #26233a;
            border-radius: 6px;
          }

          /* Fix because padding was not being applied with window#waybar */
          .modules-left {
            margin-left: 8px;
          }
          .modules-right {
            margin-right: 8px;
          }

          /* Spacing */
          #workspaces button,
          #clock,
          #network,
          #pulseaudio,
          #pulseaudio-slider,
          #battery  {
            padding: 0px 8px;
          }

          #workspaces {
            border: 1px solid transparent;
            border-radius: 4px;
            padding: 6px;
          }

          #workspaces button:hover {
            border-color: #26233a;
          }

          /* For some reason the color only works if i use this */
          #workspaces button.active * {
            color: #eb6f92;
          }


          #custom-nixos-icon {
            font-size: 16px;
            padding-right: 6px;
          }

          #pulseaudio-slider trough {
            min-width: 80px;
          }

          #pulseaudio-slider highlight {
            color: #c4a7e7;
          }
        '';
    };
  };
}
