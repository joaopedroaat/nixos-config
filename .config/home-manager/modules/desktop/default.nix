{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland/default.nix
    ./gimp.nix
    ./discord.nix
    ./firefox.nix
    ./insomnia.nix
    ./notifications.nix
    ./spicetify.nix
    ./rofi/default.nix
    ./waybar/default.nix
    ./kitty.nix
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
  };
}
