{...}: {
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>nohlsearch<CR>";
        key = "<esc><esc>";
        options = {
          desc = "Clear search highlight";
        };
      }
    ];
  };
}
