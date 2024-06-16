{
  lib,
  config,
  pkgs,
  ...
}: {
  options.aws.enable = lib.mkEnableOption "AWS CLI";
  config = lib.mkIf config.aws.enable {
    programs.awscli = {
      enable = true;
      credentials = {
        default = {
          credential_process = ''${pkgs._1password}/op item get "Amazon AWS" --fields label=password'';
        };
      };
    };
  };
}
