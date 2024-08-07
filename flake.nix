{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixvim.url = "github:nix-community/nixvim";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { self', pkgs, system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = {
              imports = [
                ./config
                ./plugins
              ];
              package = inputs.neovim-nightly-overlay.packages.${system}.default;
            };
            extraSpecialArgs = {
              svlib = pkgs.callPackage ./lib { };
            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
          };
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
          };

          devShells.default =
            pkgs.mkShell {
              packages = [ self'.formatter ];

              shellHook = ''
              # export DEBUG=1
              '';
            };
          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
