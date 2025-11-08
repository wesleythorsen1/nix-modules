{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.nix-tree;
in
{
  options.custom.modules.nix-tree.enable = lib.mkEnableOption "Enable nix-tree";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nix-tree
    ];
  };
}
