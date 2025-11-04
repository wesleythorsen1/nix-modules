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
      # nixpkgs,
      # home-manager,
      ...
    }:
    {
      homeManagerModules.default = import ./modules/home;
    };
}
