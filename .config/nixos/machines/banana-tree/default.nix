{pkgs, ...}: {
  networking.hostName = "banana-tree";

  # Configure console keymap
  console.keyMap = "us";

  # GPU
  boot.initrd.kernelModules = ["amdgpu"];
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      amdvlk
    ];
  };
}
