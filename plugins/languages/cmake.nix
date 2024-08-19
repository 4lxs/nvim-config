{ pkgs, lib, ... }:
{
  plugins = {
    lint = {
      lintersByFt.cmake = [ "cmakelint" ];
      linters.cmakelint.cmd = "${pkgs.cmake-lint}/bin/cmakelint";
    };

    lsp.enabledServers = [
      {
        name = "neocmake";
        extraOptions = {
          cmd = [ (lib.getExe pkgs.neocmakelsp) "--stdio" ];
          filetypes = [ "cmake" ];
        };
      }
    ];

    conform-nvim = {
      formattersByFt.cmake = [ "cmake_format" ];
      formatters.cmake_format.cmd = "${pkgs.cmake-format}/bin/cmake-format";
    };
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "cmake-tools.nvim";
      version = "2024-03-19";
      src = pkgs.fetchFromGitHub {
        owner = "Civitasv";
        repo = "cmake-tools.nvim";
        rev = "a4cd0b3a2c8a166a54b36bc00579954426748959";
        sha256 = "6A78j0CGDpoRcFWAlzviUB92kAemt9Dlzic1DvZNJ64=";
      };
    })
  ];

  extraConfigLua = ''
    require('cmake-tools').setup {
      cmake_build_directory = 'build',
      cmake_kits_path = vim.fn.expand("~/Projects/eba/cmake-kits.json")
    }
  '';
}
