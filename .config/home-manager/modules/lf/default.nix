{pkgs, ...}: {
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      editor-open = ''$$EDITOR $f'';
      create = ''
        ''${{
          printf "Enter name for new file or directory: "
          read NAME
          if [[ "$NAME" == */]] then
            mkdir $NAME
          else
            touch $NAME
          fi
        }}
      '';
      setWallpaper = ''
        ''${{
          ${pkgs.swww}/bin/swww img $f
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
      gd = "cd ~/Documents/";
      gD = "cd ~/Downloads/";
      gp = "cd ~/Pictures/";
      gP = "cd ~/Projects/";

      "`" = "mark-load";
      "\\'" = "mark-load";

      do = "dragon-out";

      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';

      # ...
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
}
