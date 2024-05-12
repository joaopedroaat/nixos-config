{...}: {
  imports = [
    ./desktop/default.nix
    ./nvim
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./ssh.nix
    ./golang.nix
    ./google-cloud.nix
    ./openssl.nix
    ./lf
    ./terminal-tools/default.nix
  ];
}
