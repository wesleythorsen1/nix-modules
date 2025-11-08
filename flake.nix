{
  description = "wesleythorsen1/nix-modules: reusable home-manager modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      # self,
      nixpkgs,
      # home-manager,
      ...
    }:
    let
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs [ "aarch64-darwin" "x86_64-darwin" ] (
          system:
          let
            pkgs = import nixpkgs { inherit system; };
          in
          f pkgs
        );
    in
    {
      homeManagerModules.default = import ./modules/home;

      packages = forAllSystems (pkgs: {
        pbfmt = pkgs.callPackage ./pkgs/pbfmt/default.nix { };
      });

      overlays.default = final: prev: {
        pbfmt = prev.callPackage ./pkgs/pbfmt/default.nix { };
      };
    };
}
