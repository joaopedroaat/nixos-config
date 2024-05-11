{
  lib,
  config,
  ...
}: {
  options.kitty.enable = lib.mkEnableOption "Kitty";
  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;

      font = {
        name = "JetBrainsMono Nerd Font";
      };

      theme = "Rosé Pine";

      settings = {
        confirm_os_window_close = 0;
        window_padding_width = "0 8";
      };
    };
  };
}
