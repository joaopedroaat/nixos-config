{
  pkgs,
  lib,
  config,
  ...
}: {
  options.docker.enable = lib.mkEnableOption "Docker";

  config = lib.mkIf config.docker.enable {
    virtualisation.docker.enable = true;
    environment.systemPackages = with pkgs; [
      lazydocker
    ];
  };
}
