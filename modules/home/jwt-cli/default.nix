{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.jwt-cli;
in
{
  options.custom.modules.jwt-cli.enable = lib.mkEnableOption "Enable jwt-cli";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      jwt-cli
    ];
  };
}
