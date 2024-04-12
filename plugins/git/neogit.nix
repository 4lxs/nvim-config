{ pkgs, svlib, ... }:
{
  plugins.neogit = {
    enable = true;
    package = pkgs.vimUtils.buildVimPlugin {
      pname = "neogit";
      version = "2024-04-12";
      src = pkgs.fetchFromGitHub {
        owner = "NeogitOrg";
        repo = "neogit";
        rev = "162e9c7a31e7e9a74a9a6a4b55c053820078a933";
        hash = "sha256-Uu/AyhWBNlaDxMo4lyH9U6u/KCSHbfB2rWayIBV9Alc=";
      };
      meta.homepage = "https://github.com/NeogitOrg/neogit/";
    };
    settings = {
      integration = {
        diffview = true;
        telescope = true;
      };
    };
  };

  keymaps = svlib.createKeymaps "n" {
    "<leader>gg" = {
      action.__raw = "require('neogit').open";
      desc = "Open neogit";
    };
    "<leader>gc" = {
      action = "<cmd>Neogit commit<cr>";
      desc = "Commit";
    };
    "<leader>gp" = {
      action = "<cmd>Neogit pull<cr>";
      desc = "Pull";
    };
    "<leader>gP" = {
      action = "<cmd>Neogit push<cr>";
      desc = "Push";
    };
    "<leader>gr" = {
      action = "<cmd>Neogit reset<cr>";
      desc = "Reset";
    };
    "<leader>gs" = {
      action = "<cmd>Neogit stash<cr>";
      desc = "Stash";
    };
  };
}
