{...}: {
  programs.fish = {
    enable = true;
    shellInit = ''
      set -U fish_greeting
    '';
  };
}
