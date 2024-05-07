{
  pkgs,
  lib,
  config,
  ...
}: {
  options.steam.enable = lib.mkEnableOption "Steam";
  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;

      # Allow start a game in a optmized micro-compositor
      gamescopeSession.enable = true;
    };

    environment.systemPackages = with pkgs; [
      # Overlay that shows performance info
      mangohud
      # Proton
      protonup
      # Bottles
      bottles
    ];

    # Game-mode
    programs.gamemode.enable = true;

    # To use these features you can just edit the steam execute
    # Ex: gamemoderun %command%, mangohud %command%, gamescope %command%

    # Installation path for prontonup needs to be specified
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
