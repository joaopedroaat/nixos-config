{
  lib,
  config,
  ...
}: let
  onePassPath = "~/.1password/agent.sock";
in {
  options.ssh.enable = lib.mkEnableOption "ssh";
  config = lib.mkIf config.ssh.enable {
    programs.ssh = {
      enable = true;
      extraConfig = ''
        Host *
            IdentityAgent ${onePassPath}
      '';
    };
  };
}
