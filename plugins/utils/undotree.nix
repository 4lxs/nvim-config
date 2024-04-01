{
  plugins.undotree = {
    enable = true;
    settings = {
      DiffAutoOpen = true;
      SetFocusWhenToggle = true;
    };
  };
  keymaps = [{
    mode = "n";
    key = "<leader>uu";
    action = "<cmd>UndotreeToggle<CR>";
    options = {
      silent = true;
      desc = "Undotree";
    };
  }];
}
