{pkgs, ...}: {
  programs.rofi = {
    package = pkgs.rofi-wayland;
    theme = ./theme.rasi;
  };
}
