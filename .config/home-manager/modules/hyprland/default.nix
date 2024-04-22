{
  pkgs,
  lib,
  config,
  ...
}: let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    waybar &

    swww init &

    dunst &
  '';
in {
  options.hyprland.enable = lib.mkEnableOption "Hyprland";
  config = lib.mkIf config.hyprland.enable {
    home.packages = with pkgs; [
      # Notifications
      libnotify
      dunst
      # Wallpaper
      swww
      # Clipboard
      wl-clipboard
      # Web Browser
      firefox
      # Calendar
      calcure
      # Pulsemixer
      pulsemixer
    ];

    # Waybar
    waybar.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        # Startup scripts
        exec-once = [
          ''${startupScript}/bin/start''
          "[workspace 1 silent] kitty -e tmux a"
          "[workspace 2 silent] firefox"
          "[workspace 3 silent] spotify"
          "[workspace 4 silent] 1password"
        ];

        monitor = ",preferred,auto,auto";

        # Variables
        "$terminal" = "kitty";
        "$fileManager" = "kitty --class filemanager -e lf";
        "$menu" = "rofi -show drun -show-icons";
        "$windows" = "rofi -show window -show-icons";
        "$locker" = "hyprlock";
        "$passwordManager" = "1password";

        # Default env vars.
        env = [
          "XCURSOR_SIZE,24"
          "QT_QPA_PLATFORMTHEME,qt5ct" # change to qt6ct if you have that
        ];

        # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";

          follow_mouse = 1;

          touchpad = {
            natural_scroll = "no";
          };

          sensitivity = 0; # -1.0 to 1.0, 0 means no modification.
        };

        general = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          gaps_in = 2;
          gaps_out = 1;
          border_size = 1;
          "col.active_border" = "0xffebbcba";
          "col.inactive_border" = "0xff6e6a86";

          layout = "dwindle";

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false;
        };

        decoration = {
          blur = {
            size = 3;
          };
        };

        animations = {
          enabled = "yes";
          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        dwindle = {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = "yes"; # you probably want this
        };

        master = {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true;
        };

        gestures = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = "off";
        };

        misc = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
        };

        # Example per-device config
        # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
        device = {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        };

        # Window rules
        windowrule = [
          "opacity 0.8, ^(kitty)$"
        ];

        windowrulev2 = [
          "suppressevent maximize, class:.*" # You'll probably like this.

          "float,class:(filemanager)"
          "center(1),class:(filemanager)"
          "size 960 540,class:(filemanager)"

          "float, title:(1Password)"
          "size 70% 70%, title:(1Password)"
          "center, title:(1Password)"

          "float, class:(pulsemixer)"
          "move 1171 32, class:(pulsemixer)"
          "size 741 341, class:(pulsemixer)"
          "pin, class:(pulsemixer)"
        ];

        # Bindings

        # See https://wiki.hyprland.org/Configuring/Keywords/ for more
        "$mainMod " = "SUPER";
        bind = [
          # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
          "$mainMod, RETURN, exec, $terminal"
          "$mainMod SHIFT, code:20, exec, $locker" # SUPER + SHIFT + _
          "$mainMod SHIFT, Q, killactive"
          "$mainMod SHIFT, E, exit"
          "$mainMod, E, exec, $fileManager"
          "$mainMod SHIFT, SPACE, togglefloating"
          "$mainMod, D, exec, $menu"
          "$mainMod, Menu, exec, $menu"
          "$mainMod, SPACE, exec, $windows"
          "$mainMod, P, pseudo, # dwindle"
          "$mainMod, T, togglesplit, # dwindle"
          "$mainMod, code:35, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | wl-copy" # SUPER + [
          "$mainMod SHIFT, code:35, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\"" # SUPER + SHIFT + [
          "$mainMod, code:51, exec, $passwordManager"

          # Move focus with mainMod + arrow keys
          "$mainMod, H, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, K, movefocus, u"
          "$mainMod, J, movefocus, d"

          # Switch workspaces with mainMod + [0-9]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # Move active window
          "$mainMod SHIFT, H, movewindow, l"
          "$mainMod SHIFT, J, movewindow, d"
          "$mainMod SHIFT, K, movewindow, u"
          "$mainMod SHIFT, L, movewindow, r"

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"

          # Resize active window
          "$mainMod ALT, H, resizeactive, -10 0"
          "$mainMod ALT, J, resizeactive, 0 10"
          "$mainMod ALT, K, resizeactive, 0 -10"
          "$mainMod ALT, L, resizeactive, 10 0"

          # Example special workspace (scratchpad)
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"

          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ];

        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
      };
    };
  };
}
