{ svlib, ... }:
{
  plugins.oil = {
    enable = true;
    settings = {
      use_default_keymaps = false;
      delete_to_trash = true;
      view_options = {
        show_hidden = true;
      };
      keymaps = {
        "g?" = "actions.show_help";
        "<CR>" = "actions.select";
        "<C-enter>" = "actions.select_split"; # this is used to navigate left
        "<C-t>" = "actions.select_tab";
        "<C-p>" = "actions.preview";
        "<C-c>" = "actions.close";
        "<C-r>" = "actions.refresh";
        "-" = "actions.parent";
        "_" = "actions.open_cwd";
        "`" = "actions.cd";
        "~" = "actions.tcd";
        "gs" = "actions.change_sort";
        "gx" = "actions.open_external";
        "g." = "actions.toggle_hidden";
        "q" = "actions.close";
      };
    };
  };
  keymaps = svlib.createKeymaps "n" {
    "-" = {
      action = "<cmd>Oil<cr>";
      desc = "Open oil";
    };
  };
}
