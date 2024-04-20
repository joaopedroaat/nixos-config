{
  pkgs,
  spicetify-nix,
  ...
}: let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in {
  # import the flake's module for your system
  imports = [spicetify-nix.homeManagerModule];

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Ziro;
    colorscheme = "moon";

    enabledExtensions = with spicePkgs.extensions; [
      keyboardShortcut
      loopyLoop
    ];
  };
}
