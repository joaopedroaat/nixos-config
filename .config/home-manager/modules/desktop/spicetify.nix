{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  # import the flake's module for your system
  imports = [inputs.spicetify-nix.homeManagerModule];

  options.spicetify.enable = lib.mkEnableOption "Spicetify";
  config = lib.mkIf config.spicetify.enable {
    # configure spicetify :)
    programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.Ziro;
      colorScheme = "rose-pine-moon";

      enabledExtensions = with spicePkgs.extensions; [
        keyboardShortcut
        loopyLoop
      ];
    };
  };
}
