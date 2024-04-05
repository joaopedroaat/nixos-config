{...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;

    ensureInstalled = [
      "typescript"
      "css"
      "tsx"
      "dockerfile"
      "json"
      "nix"
    ];
  };
}
