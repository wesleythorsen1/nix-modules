{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.terraform;
in
{
  options.custom.modules.terraform.enable = lib.mkEnableOption "Enable terraform";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      terraform
    ];
  };
}
