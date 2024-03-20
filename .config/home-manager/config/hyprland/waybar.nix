{...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 12;

        modules-left = [
          "hyprland/workspaces"
          "custom/arrow-light-on-bg-right"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "custom/arrow-light-on-bg-left"
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
          "format" = "{:%H:%M}";
          "format-alt" = "{:%A, %d %b, %Y}";
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
            "on-click-right" = "kitty --class=calcure -e calcure";
          };
        };

        network = {
          "format-wifi" = "";
          "format-ethernet" = "";
          "format-linked" = "";
          "format-disconnected" = "⚠";
          "tooltip-format" = "{essid}\n{ipaddr}/{cidr}";
          "tooltip" = true;
          "on-click" = "kitty --class=nmtui -e nmtui";
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
          "on-click" = "kitty --class=pulsemixer -e pulsemixer";
          "on-click-right" = "easyeffects";
          "ignored-sinks" = ["Easy Effects Sink" "Monitor of Easy Effects Sink"];
        };

        "custom/arrow-light-on-bg-left" = {
          "tooltip" = false;
          "format" = "";
        };

        "custom/arrow-dark-on-light-left" = {
          "tooltip" = false;
          "format" = "";
        };

        "custom/arrow-light-on-dark-left" = {
          "tooltip" = false;
          "format" = "";
        };

        "custom/arrow-light-on-bg-right" = {
          "tooltip" = false;
          "format" = "";
        };

        "custom/arrow-dark-on-light-right" = {
          "tooltip" = false;
          "format" = "";
        };

        "custom/arrow-light-on-dark-right" = {
          "tooltip" = false;
          "format" = "";
        };
      };
    };

    style = ''
      @define-color bg-bar #282828;
      @define-color dark-box #32302f;
      @define-color light-box #3c3836;
      @define-color light-fg #d4be98;
      @define-color dark-fg #32302f;
      @define-color selected #e78a4e;
      @define-color current_workspace #d65d0e;
      @define-color warning #d8a657;
      @define-color critical #ea6962;
      @define-color good #a9b665;
      @define-color info #7daea3;
      @define-color separator @dark-box;

      * {
        color: @light-fg;
        font-size: 13px;
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        padding: 0;
        margin: 0;
      }

      #waybar {
        background: @bg-bar;
        padding: 0 2;
      }

      #workspaces button {
        background: @light-box;
        border-bottom: 2px solid transparent;
      }

      #workspaces button.active {
        border-color: @purple;
      }

      #workspaces button.urgent {
        color: @dark-fg;
        background: @critical;
      }

      /*
       * Arrows
       */
      #custom-arrow-light-on-bg-left {
        font-size: 17px;
        color: @light-box;
        background: transparent;
      }

      #custom-arrow-light-on-bg-right {
        font-size: 17px;
        color: @light-box;
        background: transparent;
      }

      #custom-arrow-light-on-dark-left,
      #custom-arrow-light-on-dark-right {
        font-size: 17px;
        color: @light-box;
        background: @dark-box;
      }

      #custom-arrow-dark-on-light-left,
      #custom-arrow-dark-on-light-right {
        font-size: 17px;
        color: @dark-box;
        background: @light-box;
      }

      /*
       * General background
       */

      #temperature,
      #workspaces,
      #clock {
        background: @light-box;
        padding: 0 3 0 3;
      }

      #network {
        background: @light-box;
        padding: 0 11 0 3;
      }

      #pulseaudio {
        background: @light-box;
        padding: 0 6 0 3;
      }

      /*
       * Warning plugins state
       */
      #memory.warning,
      #cpu.warning,
      #battery.warning {
        color: @warning;
      }

      /*
       * Critical plugins state
       */
      #cpu.critical,
      #temperature.critical,
      #memory.critical,
      #battery.critical,
      #network.disconnected {
        color: @critical;
      }

      #mode {
        color: @dark-fg;
        background: @critical;
      }

      #battery.charging {
        color: @good;
      }

      #battery.plugged {
        color: @info;
      }

      #pulseaudio.bluetooth {
        color: @info;
      }

      tooltip {
        background: @dark-box;
      }
    '';
  };
}
