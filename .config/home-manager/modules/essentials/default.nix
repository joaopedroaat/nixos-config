{
  lib,
  config,
  ...
}: {
  imports = [
    ./git.nix
    ./ssh.nix
    ./fish.nix
    ./zsh.nix
    ./tmux.nix
    ./nvim
    ./lf
    ./nightlight.nix
    ./trash-cli.nix
    ./obsidian.nix
  ];

  options.essentials.enable = lib.mkEnableOption "Essentials";
  config = lib.mkIf config.essentials.enable {
    git.enable = true;
    ssh.enable = true;
    zsh.enable = true;
    tmux.enable = true;
    nvim.enable = true;
    lf.enable = true;
    nightlight.enable = true;
    trash-cli.enable = true;
    obsidian.enable = true;
  };
}
