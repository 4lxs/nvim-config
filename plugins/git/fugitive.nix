{
  pkgs,
  lib,
  ...
}: {
  plugins.fugitive = {
    enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    vim-rhubarb
  ];

  keymaps = let
    normal =
      lib.mapAttrsToList
      (key: action: {
        mode = "n";
        options = {
          noremap = true;
          silent = true;
        };
        inherit action key;
      })
      {
        "<leader>gg" = "<cmd>Git<cr>";
        "<leader>gd" = "<cmd>Gvdiff<cr>";
        "<leader>ga" = "<cmd>Gwrite<cr>";
        "<leader>gr" = "<cmd>Gread<cr>";
        "<leader>gb" = "<cmd>Git blame<cr>";
        "gh" = "diffget //2<cr>";
        "gl" = "diffget //3<cr>";
      };
  in
    normal;
}
