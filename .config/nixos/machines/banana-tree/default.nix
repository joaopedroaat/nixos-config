{pkgs, ...}: {
  networking.hostName = "banana-tree";

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
