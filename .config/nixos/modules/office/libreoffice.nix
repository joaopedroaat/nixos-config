{
  lib,
  config,
  pkgs,
  ...
}: {
  options.libreoffice.enable = lib.mkEnableOption "Libre Office";
  config = lib.mkIf config.libreoffice.enable {
    environment.systemPackages = with pkgs; [
      libreoffice
      # Spell check
      hunspell
      hunspellDicts.pt_BR
      hunspellDicts.en_US
    ];
  };
}
