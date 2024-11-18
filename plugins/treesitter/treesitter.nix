{
  plugins.treesitter = {
    enable = true;
    folding = true;
    nixvimInjections = true;
    settings = {
      highlight.enable = true;
      incremental_selection.enable = true;
      indent = {
        enable = true;
        disable = [
          "c"
          "cpp"
        ];
      };
      ensureInstalled = "all";
      ignore_install = [ "haskell" "haskell_persistent" ]; # crashes. idk why
    };
  };
}
