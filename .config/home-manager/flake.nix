{
  description = "Home Manager configuration of joaopedroaat";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixvim extra plugins
    lazydocker-nvim = {
      url = "github:crnvl96/lazydocker.nvim";
      flake = false;
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/Hyprlock";

    # Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
    hyprland,
    hyprlock,
    spicetify-nix,
    lazydocker-nvim,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."joaopedroaat@banana-tree" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [
        ./common-configs.nix
        ./machines/banana-tree/home.nix
        nixvim.homeManagerModules.nixvim
        hyprland.homeManagerModules.default
        hyprlock.homeManagerModules.hyprlock
      ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
      extraSpecialArgs = {
        inherit spicetify-nix;
        inherit lazydocker-nvim;
      };
    };
  };
}
