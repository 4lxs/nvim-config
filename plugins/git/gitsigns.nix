{ svlib, ... }:
{
  plugins.gitsigns = {
    enable = true;
    settings = {
      trouble = true;
    };
  };
  keymaps =
    svlib.createKeymaps "n" {
      "<leader>gh" = {
        action = "";
        desc = "+hunks";
      };
      "<leader>ghb" = {
        action = "<cmd>Gitsigns blame_line<CR>";
        desc = "Blame line";
      };
      "<leader>ghd" = {
        action = "<cmd>Gitsigns diffthis<CR>";
        desc = "Diff This";
      };
      "<leader>ghp" = {
        action = "<cmd>Gitsigns preview_hunk<CR>";
        desc = "Preview hunk";
      };
      "<leader>ghR" = {
        action = "<cmd>Gitsigns reset_buffer<CR>";
        desc = "Reset Buffer";
      };
      "<leader>ghr" = {
        action = "<cmd>Gitsigns reset_hunk<CR>";
        desc = "Reset Hunk";
      };
      "<leader>ghs" = {
        action = "<cmd>Gitsigns stage_hunk<CR>";
        desc = "Stage Hunk";
      };
      "<leader>ghS" = {
        action = "<cmd>Gitsigns stage_buffer<CR>";
        desc = "Stage Buffer";
      };
      "<leader>ghu" = {
        action = "<cmd>Gitsigns undo_stage_hunk<CR>";
        desc = "Undo Stage Hunk";
      };
      "]h" = {
        action = "<cmd>Gitsigns next_hunk<CR>";
        desc = "Next Hunk";
      };
      "[h" = {
        action = "<cmd>Gitsigns prev_hunk<CR>";
        desc = "Previous Hunk";
      };
    }
    ++ svlib.createKeymaps "v" {
      "<leader>gh" = {
        action = "";
        desc = "+hunks";
      };
      "<leader>ghr" = {
        action = "<cmd>Gitsigns reset_hunk<CR>";
        desc = "Reset Hunk";
      };
      "<leader>ghs" = {
        action = "<cmd>Gitsigns stage_hunk<CR>";
        desc = "Stage Hunk";
      };
    };
}
