{
  pkgs,
  lib,
  config,
  ...
}: {
  options.hyprland.enable = lib.mkEnableOption "Hyprland";
  config = lib.mkIf config.hyprland.enable {
    programs.hyprland.enable = true;

    # Enable Desktop Portal
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

    # Enable Pipewire
    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
