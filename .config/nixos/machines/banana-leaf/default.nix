{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "banana-leaf";

  # Configure console keymap
  console.keyMap = "br-abnt2";
}
