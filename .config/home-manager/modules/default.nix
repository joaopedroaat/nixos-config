{...}: {
  imports = [
    ./desktop/default.nix
    ./nvim
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./ssh.nix
    ./lf
    ./terminal-tools/default.nix
    ./development/default.nix
  ];
}
