{
  description = "My NixOS System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-ld-rs.url = "github:nix-community/nix-ld-rs";
  };

  outputs = {nixpkgs, ...} @ attrs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      banana-tree = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = attrs;
        modules = [
          ./common-config.nix
          ./machines/banana-tree
        ];
      };
    };
  };
}
