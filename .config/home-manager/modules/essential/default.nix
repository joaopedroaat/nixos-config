{
  lib,
  config,
  ...
}: {
  imports = [
    ./git.nix
    ./ssh.nix
    ./fish.nix
    ./tmux.nix
    ./nvim
    ./lf
  ];

  options.essential.enable = lib.mkEnableOption "Essential";
  config = lib.mkIf config.essential.enable {
    git.enable = true;
    ssh.enable = true;
    fish.enable = true;
    tmux.enable = true;
    nvim.enable = true;
    lf.enable = true;
  };
}
