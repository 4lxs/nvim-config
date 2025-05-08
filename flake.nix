{
  description = "A Lua-natic's neovim flake, with extra cats! nixCats!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";

    # neovim-nightly-overlay = {
    #   url = "github:nix-community/neovim-nightly-overlay";
    # };
  };

  outputs = { self, nixpkgs, nixCats, ... }@inputs: let
    inherit (nixCats) utils;
    luaPath = "${./.}";
    forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
    extra_pkg_config = {
      # allowUnfree = true;
    };
    dependencyOverlays = /* (import ./overlays inputs) ++ */ [
      # This overlay grabs all the inputs named in the format
      # `plugins-<pluginName>`
      # Once we add this overlay to our nixpkgs, we are able to
      # use `pkgs.neovimPlugins`, which is a set of our plugins.
      (utils.standardPluginOverlay inputs)
    ];

    categoryDefinitions = { pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
      lspsAndRuntimeDeps = {
        general = with pkgs; [
          curl
          ripgrep
          fd
        ];

        lua = with pkgs; [
          lua-language-server
          stylua
        ];

        nix = with pkgs; [
          nix-doc
          nixd
        ];

        java = with pkgs; [
          jdt-language-server
        ];

        cpp = with pkgs; [
          llvmPackages_20.clang-tools
        ];
      };

      startupPlugins = {
        general = with pkgs.vimPlugins; [
            lze
            lzextras
            snacks-nvim
            # vim-repeat
            plenary-nvim
            # nvim-notify
            mini-nvim
            # oil-nvim
        ];

        theme = with pkgs.vimPlugins;
          (builtins.getAttr (categories.colorscheme or "catppuccin-mocha") {
              "onedark" = onedark-nvim;
              "catppuccin" = catppuccin-nvim;
              "catppuccin-mocha" = catppuccin-nvim;
              "tokyonight" = tokyonight-nvim;
              "tokyonight-day" = tokyonight-nvim;
            }
          );
      };

      optionalPlugins = {
        general = with pkgs.vimPlugins; [
          blink-cmp
          blink-compat
          lazydev-nvim
          grug-far-nvim
          flash-nvim
          which-key-nvim
          gitsigns-nvim
          trouble-nvim
          conform-nvim
          nvim-lint
          nvim-lspconfig
          lualine-nvim
          persistence-nvim
          vim-kitty-navigator
          clangd_extensions-nvim
        ];

        treesitter = with pkgs.vimPlugins; [
          nvim-treesitter-textobjects
          nvim-ts-autotag
          nvim-treesitter.withAllGrammars
          ts-comments-nvim
        ];

        telescope = with pkgs.vimPlugins; [
          telescope-fzf-native-nvim
          telescope-ui-select-nvim
          telescope-nvim
        ];

        java = with pkgs.vimPlugins; [
          nvim-jdtls
        ];
      };

      # shared libraries to be added to LD_LIBRARY_PATH
      # variable available to nvim runtime
      sharedLibraries = {
        general = with pkgs; [
          # libgit2
        ];
      };

      # environmentVariables = {
      #   test = {
      #     CATTESTVAR = "It worked!";
      #   };
      # };

      # If you know what these are, you can provide custom ones by category here.
      # If you dont, check this link out:
      # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
      # extraWrapperArgs = {
      #   test = [
      #     '' --set CATTESTVAR2 "It worked again!"''
      #   ];
      # };

      # lists of the functions you would have passed to
      # python.withPackages or lua.withPackages
      # do not forget to set `hosts.python3.enable` in package settings

      # get the path to this python environment
      # in your lua config via
      # vim.g.python3_host_prog
      # or run from nvim terminal via :!<packagename>-python3
      python3.libraries = {
        test = (_:[]);
      };
      # populates $LUA_PATH and $LUA_CPATH
      extraLuaPackages = {
        test = [ (_:[]) ];
      };
    };

    packageDefinitions = {
      nvim = {pkgs , name, ... }: {
        settings = {
          suffix-path = true;
          suffix-LD = true;
          wrapRc = true;
          # aliases = [ "vim" ];
          # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
          # hosts.python3.enable = true;
          # hosts.node.enable = true;
        };
        categories = {
          general = true;

          treesitter = true;
          # telescope = true;

          lua = true;
          lua_ls_path = "${pkgs.lua-language-server}/bin/lua-language-server";
          nix = true;
          java = true;
          java-jdtls-path = "${pkgs.jdt-language-server}/bin/jdtls";
          cpp = true;

          theme = true;
          colorscheme = "catppuccin-mocha";

          lspDebugMode = false;
        };
        extra = {
        };
      };
    };

    defaultPackageName = "nvim";
  in


  forEachSystem (system: let
    nixCatsBuilder = utils.baseBuilder luaPath {
      inherit nixpkgs system dependencyOverlays extra_pkg_config;
    } categoryDefinitions packageDefinitions;
    defaultPackage = nixCatsBuilder defaultPackageName;
    pkgs = import nixpkgs { inherit system; };
  in
  {
    packages = utils.mkAllWithDefault defaultPackage;

    devShells = {
      default = pkgs.mkShell {
        name = defaultPackageName;
        packages = [ defaultPackage ];
        inputsFrom = [ ];
        shellHook = ''
        '';
      };
    };

  }) // (let
    nixosModule = utils.mkNixosModules {
      moduleNamespace = [ defaultPackageName ];
      inherit defaultPackageName dependencyOverlays luaPath
        categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
    };
    homeModule = utils.mkHomeModules {
      moduleNamespace = [ defaultPackageName ];
      inherit defaultPackageName dependencyOverlays luaPath
        categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
    };
  in {

    overlays = utils.makeOverlays luaPath {
      inherit nixpkgs dependencyOverlays extra_pkg_config;
    } categoryDefinitions packageDefinitions defaultPackageName;

    nixosModules.default = nixosModule;
    homeModules.default = homeModule;

    inherit utils nixosModule homeModule;
    inherit (utils) templates;
  });

}
