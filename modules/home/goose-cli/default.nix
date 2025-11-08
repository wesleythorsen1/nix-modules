{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.goose-cli;
in
{
  options.custom.modules.goose-cli.enable = lib.mkEnableOption "Enable goose-cli";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      goose-cli
    ];
  };
}
