{...}: {
  programs.nixvim = {
    plugins.mini = {
      enable = true;
      modules = {
        pairs.enable = true;
        move.enable = true;
        comment.enable = true;
      };
    };
  };
}
