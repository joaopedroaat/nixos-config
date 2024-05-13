{
  lib,
  config,
  ...
}: {
  imports = [
    ./hyprland
    ./gimp.nix
    ./discord.nix
    ./firefox
    ./insomnia.nix
    ./notifications.nix
    ./spicetify.nix
    ./rofi
    ./waybar
    ./kitty.nix
    ./swww.nix
    ./wl-clipboard.nix
    ./xdragon.nix
  ];
  options.desktop.enable = lib.mkEnableOption "Desktop";
  config = lib.mkIf config.desktop.enable {
    hyprland.enable = true;
    gimp.enable = true;
    discord.enable = true;
    firefox.enable = true;
    insomnia.enable = true;
    spicetify.enable = true;
    rofi.enable = true;
    waybar.enable = true;
    kitty.enable = true;
    notifications.enable = true;
    swww.enable = true;
    wl-clipboard.enable = true;
    xdragon.enable = true;
  };
}
