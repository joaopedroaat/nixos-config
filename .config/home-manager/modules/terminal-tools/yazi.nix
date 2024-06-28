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
