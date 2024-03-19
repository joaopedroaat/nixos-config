{...}: {
  programs.git = {
    enable = true;
    userName = "joaopedroaat";
    userEmail = "joaopedroaat@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
