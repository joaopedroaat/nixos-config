# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  self,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./modules
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable virtualization
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["joaopedroaat"];

  # Set your time zone.
  time.timeZone = "America/Maceio";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.joaopedroaat = {
    isNormalUser = true;
    description = "João Pedro Almeida de Andrade Tenório";
    extraGroups = ["networkmanager" "wheel" "docker" "scanner" "lp" "syncthing"];
  };

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji

    font-awesome

    # Microsoft fonts
    corefonts

    # NerdFonts
    (nerdfonts.override {fonts = ["JetBrainsMono" "FiraCode"];})
  ];

  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
    stow
    neovim
  ];

  environment.localBinInPath = true;

  users.defaultUserShell = pkgs.zsh;

  # Common modules
  _1password.enable = true;
  docker.enable = true;
  zsh.enable = true;
  hyprland.enable = true;
  office.enable = true;
  sync.enable = true;
  bluetooth.enable = true;

  # Run unpatched dynamic binaries on NixOS.
  programs.nix-ld = {
    enable = true;
    package = self.inputs.nix-ld-rs.packages.${pkgs.hostPlatform.system}.nix-ld-rs;
    libraries = with pkgs; [
      stdenv.cc.cc
      openssl
      glibc
    ];
  };

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
