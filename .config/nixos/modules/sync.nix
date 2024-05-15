{
  lib,
  config,
  ...
}: {
  options.sync.enable = lib.mkEnableOption "Sync";
  config = lib.mkIf config.sync.enable {
    services.syncthing = {
      enable = true;

      user = "joaopedroaat";

      dataDir = "/home/joaopedroaat/";

      overrideDevices = true;
      overrideFolders = true;
    };

    networking.firewall = {
      allowedTCPPorts = [8384 22000];
      allowedUDPPorts = [22000 21027];
    };
  };
}
