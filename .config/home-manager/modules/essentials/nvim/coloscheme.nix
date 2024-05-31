{...}: {
  programs.nixvim = {
    colorschemes.rose-pine = {
      enable = true;
      style = "main"; # main, moon or dawn
    };
  };
}
