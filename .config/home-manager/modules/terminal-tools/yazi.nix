{
  lib,
  config,
  pkgs,
  ...
}: {
  options.yazi.enable = lib.mkEnableOption "Yazi";
  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        log = {
          enabled = true;
        };
      };
      keymap = {
        manager.prepend_keymap = [
          {
            on = ["<C-n>"];
            run = ''
              shell '${pkgs.xdragon}/bin/xdragon -x -i -T "$@"' --confirm
            '';
            desc = "Drag select files with Dragon";
          }
          {
            on = ["y"];
            run = [
              "yank"
              ''
                shell --confirm 'for path in "$@"; do echo "file://$path"; done | ${pkgs.wl-clipboard}/bin/wl-copy -t text/uri-list'
              ''
            ];
            desc = "Yank to clipboard";
          }
          {
            on = ["<C-s>"];
            run = "shell '$SHELL' --block --confirm";
            desc = "Open shell here";
          }
        ];
      };
    };

    home.packages = with pkgs; [
      ffmpegthumbnailer # Video thumbnails
      unar # Archive preview
      jq # JSON preview
      poppler # PDF preview
      fd # File searching
      ripgrep # File content searching
      fzf # File subtree navigation
      zoxide # Historical dir navigation
      wl-clipboard # Clipboard support
    ];
  };
}
