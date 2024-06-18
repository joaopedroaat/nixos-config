{...}: {
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;

      #Enable telescope support
      enableTelescope = true;

      # Mark files on save
      saveOnToggle = false;

      # Save harpoon files on change
      saveOnChange = true;

      # Each git branch has it's own marks
      markBranch = true;

      keymaps = {
        addFile = "ma";
        navPrev = "mp";
        navNext = "mn";
        toggleQuickMenu = "mq";
      };
    };

    keymaps = [
      {
        action = "<cmd>Telescope harpoon marks<CR>";
        key = "<leader>fm";
        options = {desc = "Find marks";};
      }
    ];
  };
}
