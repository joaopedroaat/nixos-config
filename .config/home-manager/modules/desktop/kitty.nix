{
  lib,
  config,
  hostname,
  ...
}: {
  options.kitty.enable = lib.mkEnableOption "Kitty";
  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;

      font = {
        name = "JetBrainsMono Nerd Font";
        size =
          if hostname == "banana-tree"
          then null
          else 9;
      };

      theme = "Rosé Pine";

      settings = {
        confirm_os_window_close = 0;
        window_padding_width = "0 8";
      };
    };
  };
}
