{
  lib,
  config,
  pkgs,
  ...
}: {
  options.lutris.enable = lib.mkEnableOption "Lutris";

  config = lib.mkIf config.lutris.enable {
    environment.systemPackages = with pkgs; [
      (lutris.override {
        extraLibraries = pkgs: [
          # List library dependencies here
        ];
      })
    ];
  };
}
