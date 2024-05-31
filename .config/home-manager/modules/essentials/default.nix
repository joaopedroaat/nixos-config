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

  options.essentials.enable = lib.mkEnableOption "Essentials";
  config = lib.mkIf config.essentials.enable {
    git.enable = true;
    ssh.enable = true;
    fish.enable = true;
    tmux.enable = true;
    nvim.enable = true;
    lf.enable = true;
  };
}
