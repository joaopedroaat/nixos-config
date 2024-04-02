{...}: {
  programs.nixvim = {
    # Remove Highlight from SignColumn
    autoCmd = [
      {
        event = "VimEnter";
        command = "highlight clear SignColumn";
        once = true;
        desc = "Remove signcolumn highlight";
      }
    ];
  };
}
