{
  pkgs,
  lib,
  config,
  ...
}: let
  src = {
    kitty = "${pkgs.kitty}/bin/kitty";
    xdragon = "${pkgs.xdragon}/bin/xdragon";
    xdg-open = "${pkgs.xdg-utils}/bin/xdg-open";
    swww = "${pkgs.swww}/bin/swww";
    fzf = "${pkgs.fzf}/bin/fzf";
    bat = "${pkgs.bat}/bin/bat";
  };
in {
  options.lf.enable = lib.mkEnableOption "lf";
  config = lib.mkIf config.lf.enable {
    xdg.configFile."lf/icons".source = ./icons;

    programs.lf = {
      enable = true;
      commands = {
        # Drag and drop
        dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x $fx'';

        open-terminal = ''
          ''${{
            setsid ${src.kitty} $PWD >/dev/null 2>&1 &
          }}
        '';

        open-xdg = ''
          ''${{
            for file in $fx; do
                setsid ${src.xdg-open} "$file" >/dev/null 2>&1 &
            done
          }}
        '';

        # Open on editor
        editor-open = ''$$EDITOR $f'';

        # Create directory or file
        create = ''
          ''${{
            # Prompt the user for input
            read -p "Enter name for new file or directory: " input

            # Check if the input ends with "/"
            if [[ "$input" == */ ]]; then
                # Create a directory
                mkdir "$input"
            else
                # Create a file
                touch "$input"
            fi
          }}
        '';

        # Set current desktop wallpaper
        setWallpaper = ''
          ''${{
            ${src.swww} img $f
          }}
        '';

        # Search files and jump to it
        fzfJump = ''
          ''${{
            res="$(find . -maxdepth 3 | ${src.fzf} --reverse --header='Jump to location')"
            if [ -n "$res" ]; then
              if [ -d "$res" ]; then
                  cmd="cd"
              else
                  cmd="select"
              fi
              res="$(printf '%s' "$res" | sed 's/\\/\\\\/g;s/"/\\"/g')"
              lf -remote "send $id $cmd \"$res\""
            fi
          }}
        '';

        # Preview file on bat
        batFile = ''
          ''${{
            ${src.bat} --paging=always --theme="base16" "$f"
          }}
        '';
      };

      keybindings = {
        "\\\"" = "";
        d = "";

        # Basic functions
        a = "create";
        dd = "delete";
        x = "cut";
        y = "copy";
        R = "reload";
        c = "clear";
        "<enter>" = "open";
        "<space>" = "toggle";
        "." = "set hidden!";
        bg = "setWallpaper";

        # Movement
        "g/" = "cd /";
        "g~" = "cd";
        gg = "cd";
        gd = "cd ~/Documents/";
        gD = "cd ~/Downloads/";
        gp = "cd ~/Pictures/";
        gP = "cd ~/Projects/";

        # Search and Jump
        f = "fzfJump";

        "`" = "mark-load";
        "\\'" = "mark-load";

        do = "dragon-out";

        # Open xdg
        oo = "open-xdg";

        # Open folder on terminal
        ot = "open-terminal";

        # Open editor
        ee = "editor-open";

        # Preview file
        V = "batFile";
      };

      settings = {
        preview = true;
        hidden = false;
        drawbox = true;
        icons = true;
        ignorecase = true;
      };

      extraConfig = let
        previewer = pkgs.writeShellScriptBin "pv.sh" ''
          file=$1
          w=$2
          h=$3
          x=$4
          y=$5

          if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
              ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
              exit 1
          fi

          ${pkgs.pistol}/bin/pistol "$file"
        '';
        cleaner = pkgs.writeShellScriptBin "clean.sh" ''
          ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
        '';
      in ''
        set cleaner ${cleaner}/bin/clean.sh
        set previewer ${previewer}/bin/pv.sh
      '';
    };

    # ...
  };
}
