{
  pkgs,
  lib,
  config,
  ...
}: {
  options.lf.enable = lib.mkEnableOption "lf";
  config = lib.mkIf config.lf.enable {
    xdg.configFile."lf/icons".source = ./icons;

    programs.lf = {
      enable = true;
      commands = {
        dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
        editor-open = ''$$EDITOR $f'';
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
        setWallpaper = ''
          ''${{
            ${pkgs.swww}/bin/swww img $f
          }}
        '';
        fzfJump = ''
          ''${{
            res="$(find . -maxdepth 3 | ${pkgs.fzf}/bin/fzf --reverse --header='Jump to location')"
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
        batFile = ''
          ''${{
            ${pkgs.bat}/bin/bat --paging=always --theme="base16" "$f"
          }}
        '';
      };

      keybindings = {
        # Unbind
        "\\\"" = "";
        o = "";
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
