{...}: {
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      ensureInstalled = [
        "typescript"
        "css"
        "tsx"
        "dockerfile"
        "json"
        "jsonc"
        "yaml"
        "nix"
        "go"
        "python"
      ];
    };

    treesitter-context = {
      enable = true;
      maxLines = 1;
    };
  };
}
