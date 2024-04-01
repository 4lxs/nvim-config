{ pkgs, svlib, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "competitest.nvim";
      version = "2024-03-19";
      src = pkgs.fetchFromGitHub {
        owner = "xeluxee";
        repo = "competitest.nvim";
        rev = "c3cb0e2b0916a879c4d3dcb5737e6c046dd0afc5";
        sha256 = "ABxdZ98W5W6K0rz0z/1I5lXzLCBnth6ozUUQ1W1nvpo=";
      };
    })
  ];

  extraConfigLua = ''
    require('competitest').setup {
      received_problems_path = vim.env.HOME .. "/Projects/cp/problems/$(JUDGE)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)",
      template_file = vim.env.HOME .. "/Projects/cp/templates/template.$(FEXT)",
      evaluate_template_modifiers = true,
      compile_command = {
        cpp = {
          exec = "g++",
          args = {
            "-DLOCAL",
            "$(FNAME)",
            "-o",
            "$(FNOEXT)",
            "-Wall",
            "-Wextra",
            "-pedantic",
            "-std=c++17",
            "-O2",
            "-Wshadow",
            "-Wformat=2",
            "-Wfloat-equal",
            "-Wshift-overflow",
            "-Wcast-qual",
            "-Wcast-align",
            "-D_GLIBCXX_DEBUG",
            "-D_GLIBCXX_DEBUG_PEDANTIC",
            "-fsanitize=address",
            "-fsanitize=undefined",
            "-fno-sanitize-recover",
            "-fstack-protector",
          },
        },
      },
    }
  '';

  keymaps = svlib.createKeymaps "n" {
    "<leader>ctr" = {
      action = "<cmd>CompetiTest receive problem<cr>";
      desc = "CompetiTest receive problem";
    };
    "<leader>ctt" = {
      action = "<cmd>CompetiTest run<cr>";
      desc = "CompetiTest run";
    };
    "<leader>cta" = {
      action = "<cmd>CompetiTest add_testcase<cr>";
      desc = "CompetiTest Add testcase";
    };
    "<leader>cte" = {
      action = "<cmd>CompetiTest edit_testcase<cr>";
      desc = "CompetiTest Edit testcase";
    };
    "<leader>ctd" = {
      action = "<cmd>CompetiTest delete_testcase<cr>";
      desc = "CompetiTest Delete testcase";
    };
  };
}
