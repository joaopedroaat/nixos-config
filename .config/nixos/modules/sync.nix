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

      settings = let
        hostname = config.networking.hostName;
        device =
          if hostname == "banana-tree"
          then "banana-leaf"
          else "banana-tree";
        deviceId =
          if hostname == "banana-tree"
          then "7BHQOOK-QQSS2AG-ZOOHCGZ-J7EF4W3-KJHTWXS-CBWA7P7-E52CPT4-33TNYA2"
          else "BDUIVNQ-IWB4RYX-LXMCIMB-GWBDLCW-ONAFMCN-MCWV5LP-QCCNQUA-2K6AEQD";
      in {
        devices = {
          ${device} = {id = deviceId;};
        };

        folders = let
          devices = [
            (
              if hostname == "banana-tree"
              then "banana-leaf"
              else "banana-tree"
            )
          ];
        in {
          "Documents" = {
            path = "/home/joaopedroaat/Documents";
            inherit devices;
          };

          "Pictures" = {
            path = "/home/joaopedroaat/Pictures";
            inherit devices;
          };

          "Projects" = {
            path = "/home/joaopedroaat/Projects";
            inherit devices;
          };

          "Music" = {
            path = "/home/joaopedroaat/Music";
            inherit devices;
          };

          "Videos" = {
            path = "/home/joaopedroaat/Music";
            inherit devices;
          };
        };
      };
    };

    networking.firewall = {
      allowedTCPPorts = [8384 22000];
      allowedUDPPorts = [22000 21027];
    };
  };
}
